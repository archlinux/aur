Do to the use of the `-DFEATURE_no_direct_extern_access=ON` flag in upstream `qt6-base`, I had to take a very non-standard approatch to make this work for QT6 builds.
If upstream drops the `-DFEATURE_no_direct_extern_access=ON` flag at any point, mark this package as out of date so I can remove the non-standard logic accordingly.
