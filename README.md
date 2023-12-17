Do to the use of the `-DFEATURE_no_direct_extern_access=ON` flag in upstream `qt6-base`, I had to take a very non-standard approatch to make this work for QT6 builds.
Those still on QT5 systems won't be effected as `qmake6` won't be on your system unless you went and installed `qt6-base`.
If this is a problem for whatever reasion, please leave a comment on this AUR package, I'll try comming up with a work around of some kind.
If upstream drops the `-DFEATURE_no_direct_extern_access=ON` flag at any point, mark this package as out of date so I can remove the non-standard logic accordingly.
