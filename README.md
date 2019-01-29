kwin-aurorae-optional-titlebar
---

A hacked version of the KWin theme engine Aurorae that allows skipping title bars for a user-defined set of applications.

__This is NOT intended as a permanent solution. This hack would NOT work with every case (otherwise the problem should be much simpler). I sincerely suggest related KDE and GTK developers to really look into the problem of CSD GTK windows and the mess of custom CSD sh*t and get them sorted out. Users have been suffering for years.__

Installation
---

Just build the package with `makepkg` and install it plus reboot. Only ArchLinux is supported by me for now.

Usage
---

First, you need to use the KWin script or Window Rules or even `gtk-nocsd` to ensure decoration (title bar and borders) on all GTK windows (or a subset of your choice).

Create a file `~/.aurorae_notitle` with content like

```
window_class_1
window_class_2
......
```

where the window classes of windows that you think should not have a title bar (but should have a shadow!) are filled in line-by-line.

This file takes effect immediately. Just re-open the corresponding application window and voila! You should finally have a GTK CSD window that has shadows but with only one title bar from GTK itself.

Of course you will need a proper theme for uniform look of GTK and your desktop itself.

Background
---

As everyone knows, KDE and GTK client-side decorated applications do not work well together. KDE cannot communicate with GTK to add proper shadows around the GTK client-side decorated windows. This problem has been around for years and no one has really even committed even a little bit of effort to resolve it because it would require

1) either KDE to support GTK's custom protocol
2) or GTK to support KDE's custom protocol

none of which seem likely at all by far. No one would like to support others' custom home-grown tech and nobody has come up with a ultimate solution yet.

I do not feel like commenting on any of their development process, but I personally can't bear even a second about the problem. Avoiding GTK is impractical - at least Firefox and Chromium both uses GTK and will switch to CSD some time. A lot of well-designed Electron apps are also GTK-based.

There is a solution to enforce server-side decoration in `KWin`, which can at least get those apps usable, but now you are faced with the double-notch problem which is even more annoying. Fortunately, with the default decoration, `Breeze`, there is an option to disable the title bar for specific windows, which yields very good-looking results, almost indistinguishable with real GTK CSD windows on GNOME. But also unfortunately, this __only__ works with `Breeze`.

A lot of KDE decoation themes use the included theme engine, `Aurorae`, which provides simple SVG-based styling for `KWin`. This engine, by default, does not support `Breeze`-like per-window title-bar-hiding settings. So I decided to screw it and put some dirty hack together to get things at least usable for now.