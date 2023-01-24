# F-Chat Rising PKGBUILD

For more information on F-Chat Rising, see [the github for it.](https://github.com/mrstallion/fchat-rising)

This builds directly from source and depends on a system-wide install of `electron` instead of using a bundled version.

## Custom Patch Included

This version also includes a convenience patch for saving any unsent messages in channels to a file under the log directory as `deadletter.log`. Though intentionally closing F-Chat's last tab will not allow it to save, on unstable connections it is immensely helpful to avoid losing paragraphs of work while composing in a channel.
