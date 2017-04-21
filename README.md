GTK3-mushrooms
===

This is a set of patches for GTK3 library that makes it better for me and maybe for you too. ;-)
It is based on official GTK3 package from Arch Linux (but compiles GTK3 without documentation and Broadway backend).
I have not wide knowledge about programming in C, so quality of this patches can be not good.
But it works! See list of patches below.

CSD
---

* Totally and permanently disables CSD. All windows are decorated only by window manager.
* Removes minimize/maximize/close buttons from headerbar.
* Removes application menu button from headerbar.
* Makes application menu accessible as context menu of headerbar.

File chooser
---

* Removes "Other locations" button from places bar and shows all mounted devices and drives directly.
* Disables very annoying single-click "feature" in file list. See: https://bugzilla.gnome.org/show_bug.cgi?id=766089
* Removes XDG user directories (like Pictures, Downloads, Documents) from places sidebar. They can be added as bookmarks.

Print dialog
---

* Makes appearance of print dialog less "gnomish".
* Sets Atril instead of Evince as default previewer.

General
---

* Scrollbars are always visible. Environment variable is not needed.

--------

In future
---

* Message dialogs: restore appearance like in GTK2.
* CSD headerbar: remove application title when it is displayed in WM decoration.
* Adwaita theme: make default controls (buttons, checkboxes etc.) smaller.
* File chooser: restore typeahead feature in file list. See: https://aur.archlinux.org/packages/gtk3-typeahead
* Menus: remove delay before show mnemonics.
