# nicelock

Shell script for making i3lock look nice.

Run with `nicelock`.

## Notifications

`nicelock` will automatically suspend dunst notifications and show a notification when locking.

## Automatic locking

Example using `xss-lock`

```sh
xss-lock -- /usr/bin/nicelock
```

Place this is your `.xinitrc` or spawn it in your window manager like this in `xmonad`:

```hs
myStartupHook = do
    ...
    spawnOnce "xss-lock -- /usr/bin/nicelock"
    ...
    defaults = def {
    ...
    startupHook        = myStartupHook
    }
```
