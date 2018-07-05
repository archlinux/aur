# maximal

A minimal utility that hides the titlebar when a window is maximized in Gnome (and soon also in Cinnamon due to https://github.com/linuxmint/Cinnamon/issues/7681).

## Motivation

This is my take on a pretty much demanded feature. It was born out of disconformity with the current state of affairs:

1.  The "maximus like" extensions are very clever but dirty, dirty hacks that try to infer the client id in non standard ways, call external tools, hook from many events... don't get me wrong, it's impressive that the extension developers somehow managed to get around the limitations imposed by the "everything CSD" adamant stand of Gnome. But anyway the extensions make the programmer in me cry in despair. Moreover, they all show some rough edges.

2. Another option is to tweak the metacity theme to make the titlebar almost invisible, setting a 0 size font... I'm going to stop here.

3. Finally there is a script around there that is always pulling information from the X system and setting `_GTK_HIDE_TITLEBAR_WHEN_MAXIMIZED` for every client. But it should be the other way around, the script should react to window creation events.

## Usage

What `maximal` does is indeed quite minimal: it listens for normal window creation events and sets the `_GTK_HIDE_TITLEBAR_WHEN_MAXIMIZED` property.

To disable it just send a `TERM` signal to the process; this restores the previous state of `_GTK_HIDE_TITLEBAR_WHEN_MAXIMIZED` for each managed window. When you run `maximal` again it will detect every open normal window and make its title hideable on maximize, then enter the main event handling loop as usual. This all means that you can add a shortcut like `bash -c 'killall maximal || maximal'` to your WM in order to toggle `maximal` on and off.

You can set a whitelist and/or a blacklist of patterns by exporting the environment variables `MAXIMAL_WHITELIST` and `MINIMAL_WHITELIST`. These variables must contain a comma separated list of regular expressions (as defined [here](https://docs.python.org/3/library/re.html)). Whitespace before and after the commas is ignored. The patterns are matched against a target with format `<wm_class[0]>::<wm_class[1]>::<wm_name>`; for instance, the target for my current firefox window (showing this page) is `Navigator::Firefox::memeplex/maximal: Maximal, a minimal utility that hides the titlebar when a window is maximized in Gnome (also in Cinnamon -master branch-) - Mozilla Firefox`. If no whitelist and no blacklist are given, every client is matched. If there is a whitelist but no blacklist, only whitelisted clients are matched. In there is a blacklist but no whitelist, only clients not blacklisted are matched. If both a whitelist and a blacklist are set, only clients whitelisted but not blacklisted are matched. For convenience, a `.*` prefix and a `.*` suffix are automatically appended to the pattern.

## Installation

If you're on Arch or an Arch-based distro (like Manjaro) you can install `maximal` from the AUR:

`yaourt -S maximal`

Otherwise use `pip`:

* For system-level installation run `pip install git+https://github.com/memeplex/maximal.git`

* For user-level installation run `pip install --user git+https://github.com/memeplex/maximal.git`

Then add something like the following to your `~/.xprofile` and start a new session:

```
export MAXIMAL_WHITELIST=...
export MAXIMAL_BLACKLIST=...
maximal &
```

Additionally you can add a shortcut like `bash -c 'killall maximal || maximal'` to your WM in order to toggle `maximal` on and off.

## TODO

* [X] Add ability to disable / reenable.
* [X] Allow to apply only to wm classes matching some pattern.
* [X] Allow pip installation.
* [X] Check if it works fine with multiple monitors.
* [X] Make arch PKGBUILD.
* [X] Remove `time.sleep` or understand why it's needed.
