# The default desktop entry file (contained in the AppImage) uses the internal
# `AppRun` script as its executable, which is replaced by the actual path when
# you "install" the program. In our case the executable path is already known
# and to reuse this extracted desktop entry file I just have to patch the `Exec`
# and add the `TryExec` fields. All other fields look fine to me.

/^Exec=/ {
  print "Exec=" executable_path " %U"
  print "TryExec=" executable_path
  next
}

/^TryExec=/ {
  next
}

# See <https://stackoverflow.com/a/23478836/12005228>, in short a non-zero value
# here makes awk print all unmatched lines as-is.
1
