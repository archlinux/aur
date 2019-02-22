# How to install

First download this reposity as:

``` bash
git clone https://github.com/ryukinix/wps-office-pkgbuild
cd wps-office-pkgbuild
```

So then build it and install:

``` bash
makepkg -i
```

And it's it. You can call now all the three main packages from your
launch searching by WPS. There is a text processor (wps), spredsheet
(et) and presentation (wpp).

# Personal opinion vs LibreOffice

It's truly more faster than LibreOffice and works really well with
MicroSoft formats, .docx, .xls and .ppt. May you need install
additional fonts like [ttf-wps-fonts] and [ttf-ms-fonts] available at AUR.

**BUT BE CAREFUL! THERE IS NO SUPPORT FOR OPENDOCUMENT FORMATS!**

Keep your LibreOffice (or similar) installed for them. WPS should be
used only for Microsoft documents.

[ttf-wps-fonts]: http://aur.archlinux.org/packages/ttf-wps-fonts
[ttf-ms-fonts]: http://aur.archlinux.org/packages/ttf-ms-fonts
