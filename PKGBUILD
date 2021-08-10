# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ghost-deps-meta
pkgver=20210810
pkgrel=1
pkgdesc="Metapkg for cleaning the AUR, provide no longer existing packages for finding pkgbuilds that need a fix"
arch=(any)
url=""
license=(GPL)
optdepends=(dmenu dwm st slock surf sxiv)
provides=(tui dbus-core mono-stable msbuild-stable gtk3-print-backends libudev.so.0
          oculus-rift-sdk-jherico-git oculus-rift-sdk libusbx mesa-hybris
          xorg-server1.12 xorg-server1.19-git catalist-utils
          nvidia-96xx-utils nvidia-173xx-utils nvidia-318xx-utils nvidia-310xx-utils
          nvidia-304xx-utils nvidia-346xx-utils nvidia-352xx-utils nvidia-450xx-utils
          jack-audio-connection-kit opencl-catalyst xcursor-hackneyed eject jdk5
          python2-jswebkit skype skype-legacy
          xf86dgaproto resourceproto scrnsaverproto bigreqsproto compositeproto
          dmxproto fontsproto glproto inputproto randrproto recordproto renderproto
          resourceproto scrnsaverproto videoproto xcmiscproto xf86dgaproto xf86driproto
          xineramaproto xextproto xf86vidmodeproto xproto dri3proto presentproto
          dri3proto presentproto
          llvm-libs-pypy-stm clang-pypy-stm llvm-pypy-stm nodejs-grunt-cli node-webkit
          perl-data-pond perl-perl6-junction
          systemd-tools jade markdown asp.net-bin yaourt
          mutagen ladspa-plugins spice-glib gcc-multilib gnu-efi-libs
          libwebkit libsystemd heirloom-mailx mailx mailx-heirloom
          fsharp-mono-bin monodevelop-stable python2-gtkspell opentk
          nuvolaplayer-git python-django18 wxgtk
          qscintilla-qt4 python-qscintilla-qt4 python2-qscintilla-qt4 python-qscintilla-qt4-common
)

#pkgver() { date +%Y%m%d }

# systemd-tools -> systemd
# jade          -> openjade
# markdown      -> discount
# spice-glib    -> spice-gtk
# mutagen       -> python2-mutagen
# gnu-efi-libs  -> gnu-efi
# libwebkit     -> webkitgtk2
# libsystemd    -> systemd-libs
# heirloom-mailx-> s-nail
# mailx         -> s-nail
# mailx-heirloom-> s-nail
# wxgtk         -> wxgtk2
# ebtables      -> iptables-nft
# cdrkit        -> cdrtools
# fuse          -> fuse2
# gdisk         -> gptfdisk
# procps        -> procps-ng
#
# python2-gtkspell -> python2-gtkspellcheck
# geoclue2      -> geoclue
# go-pie        -> go
# gcc-multilib  -> gcc (null)
# mime-types    -> mailcap
# python-distribute -> python-setuptools
# python-sphinx-2 - old version of python-sphinx
#
# fsharp-mono-bin - wrong name -> fsharp-4.5-bin
# monodevelop-stable - wrong name -> monodevelop-8.4
#
# Not to provide: udev initramfs opengl-driver libgl smtp-forwarder cron libjpeg
