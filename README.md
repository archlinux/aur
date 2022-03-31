# Noto CJK Variable Fonts

## What's up with all these split packages?

That's a lot of split packages, I suggest that you start by reading the fonts formats documentation in the  
`README.md` files of the [Sans](https://github.com/googlefonts/noto-cjk/blob/main/Sans/README.md) or [Serif](https://github.com/googlefonts/noto-cjk/blob/main/Serif/README.md) fonts before asking what you should install.

There are 3 types of packages here:

* `noto-fonts-cjk-vf`: `Variable OTCs`  
  It's recommended to set the `LANG` or `LANGUAGE` environment variables (e.g. `LANG=zh_CN.UTF-8`),  
  which will select the correct glyphs.  
  Without it, the fonts might fall back to Japanese glyphs when the language of a text cannot be defined or  
  auto-recognized (or too costly to recognize) by the application, and the OpenType locl is not being set.  
  Other environment variables: `FC_LANG`, `PANGO_LANGUAGE`.  
  For this to work correctly, HarfBuzz 3.3.0 or newer is required, see more details below.
* `noto-fonts-cjk{-language}-vf`: `Variable Multilingual OTF`  
  Multi-lingual CJK with a default language set for applications that don't apply OpenType locl.  
  You can still set  `LANG` or `LANGUAGE` environment variables and the setting will be respected,  
  but if you don't then it will use the default language set in the font.
* `noto-fonts{-language}-vf`: `Variable Region-specific OTF`  
  Containing only a subset version of the font for a specific language.  
  Multi-lingual monospace font is packaged because there aren't subset versions of monospace fonts.  
  I'm not completely sure about the font config for the monospace font, so feedback would be appreciated.

## Variable OTCs and HarfBuzz <3.0.0

Before HarfBuzz 3.3.0, the `Variable OTCs` fonts were pretty much unusable with apps that use Pango for rendering fonts.  
It was possible to make them sort of working by explicitly configuring apps to load the specific regional/language  
font variant (e.g. `Noto Sans CJK SC`), and by using the `<alias>` and `<prefer>` elements in `fonts.conf`  
(see details in [the Arch Wiki](https://wiki.archlinux.org/title/Fonts#Fallback_font_order)),  but it was a hit-and-miss, and it should have worked without any extra setting,  
automatically loading the missing glyphs from the fonts.  
From what I can tell, it's fixed since HarfBuzz 3.3.0, but anything that brings it own  
outdated `libharfbuzz.so` will still be broken. This means Flatpak, AppImage, proprietary, etc.  
[My MR backporting the needed changes to the Freedesktop Flatpak runtime](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/merge_requests/7971) was merged, so you can expect that this  
issue will be fixed for applications that use the following runtimes or newer: `Freedesktop 21.08`, `Gnome 41`, `KDE 5.15-21.08`.

## Other notes

* The packaged fonts versions will lag a couple of days behind the latest upstream release.  
  This is because Github's auto-generated tarball for the latest git commit is not available  
  immediately, likely due to the size of ref checkout.  
  I prefer to avoid switching to a git source, as cloning is too slow, and ~7GB git repo is not  
  something I want to keep around for a package that does not requires frequent updates.

## Updates

* 2022-04-01: The issue affecting Variable OTCs is related to HarfBuzz and was fixed in version 3.3.0.  
  So this is fixed not only for system installed applications, but soon also with Flatpak applications that  
  use runtimes based on `Freedesktop 21.08`, as the runtime's libharfbuzz 3.0.0 is patched with the fix.
* 2022-02-23: A section about OpenType locl issue with Pango apps was added. It's recommended to  avoid the  
  `Variable OTCs` package.
* 2022-01-26: There are now variable Serif fonts for all the languages. The generated packages are much smaller.
