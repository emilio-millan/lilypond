/*
  note-performer.cc -- implement Drum_note_performer

  source file of the GNU LilyPond music typesetter

  (c) 1996--2006 Jan Nieuwenhuizen <janneke@gnu.org>
*/

#include "performer.hh"
#include "audio-item.hh"
#include "audio-column.hh"
#include "global-context.hh"
#include "pitch.hh"
#include "stream-event.hh"
#include "translator.icc"
#include "warn.hh"

class Drum_note_performer : public Performer
{
public:
  TRANSLATOR_DECLARATIONS (Drum_note_performer);

protected:
  void stop_translation_timestep ();
  void process_music ();
  DECLARE_TRANSLATOR_LISTENER (note);
private:
  vector<Stream_event*> note_evs_;
  vector<Audio_note*> notes_;
};

Drum_note_performer::Drum_note_performer ()
{
}

void
Drum_note_performer::process_music ()
{
  SCM tab = get_property ("drumPitchTable");

  while (note_evs_.size ())
    {
      Stream_event *n = note_evs_.back ();
      note_evs_.pop_back ();
      SCM sym = n->get_property ("drum-type");
      SCM defn = SCM_EOL;

      if (scm_is_symbol (sym)
	  && (scm_hash_table_p (tab) == SCM_BOOL_T))
	defn = scm_hashq_ref (tab, sym, SCM_EOL);

      if (Pitch *pit = unsmob_pitch (defn))
	{
	  Audio_note *p = new Audio_note (*pit, get_event_length (n), 0);
	  Audio_element_info info (p, n);
	  announce_element (info);
	  notes_.push_back (p);
	}
    }

  note_evs_.clear ();
}

void
Drum_note_performer::stop_translation_timestep ()
{
  // why don't grace notes show up here?
  // --> grace notes effectively do not get delayed
  Moment now = now_mom ();
  for (vsize i = 0; i < notes_.size (); i++)
    play_element (notes_[i]);
  notes_.clear ();
  note_evs_.clear ();
}

IMPLEMENT_TRANSLATOR_LISTENER (Drum_note_performer, note);
void
Drum_note_performer::listen_note (Stream_event *ev)
{
  note_evs_.push_back (ev);
}

ADD_TRANSLATOR (Drum_note_performer,
		"Play drum notes.", "",
		"note-event", "", "");
