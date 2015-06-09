#ifndef TAGS_DIALOG_H
#define TAGS_DIALOG_H


#include <audiere.h>
#include "wx.h"


class TagsDialog : public wxDialog {
public:
  TagsDialog(
    wxWindow* parent,
    audiere::SampleSourcePtr source);

private:
  void OnButton(wxCommandEvent& event);
  void OnClose(wxCloseEvent& event);

  wxListBox* m_tags;
  wxButton* m_close;

  DECLARE_EVENT_TABLE()
};
#endif
