# Maintainer: Your Name <your@email.com>
# This file is managed automatically by the webkit2gtk-automator.
# Manual edits will be overwritten on the next build.
# Source: https://github.com/Brodino96/webkit2gtk-automator

pkgname=webkit2gtk-bin
pkgver=2.50.6
pkgrel=5
pkgdesc="Web content engine for GTK (prebuilt binary)"
url="https://webkitgtk.org"
arch=(x86_64)
license=(
  'AFL-2.0 OR GPL-2.0-or-later'
  Apache-2.0
  'Apache-2.0 WITH LLVM-exception'
  BSD-2-Clause
  BSD-2-Clause-Views
  BSD-3-Clause
  BSD-Source-Code
  BSL-1.0
  bzip2-1.0.6
  GPL-2.0-only
  'GPL-3.0-only WITH Autoconf-exception-3.0'
  'GPL-3.0-or-later WITH Bison-exception-2.2'
  ICU
  ISC
  LGPL-2.1-only
  LGPL-2.1-or-later
  MIT
  MPL-1.1
  MPL-2.0
  NCSA
  'NCSA OR MIT'
  OFL-1.1
  SunPro
  Unicode-TOU
)
depends=(
  at-spi2-core
  atk
  bubblewrap
  cairo
  enchant
  expat
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-bad-libs
  gst-plugins-base-libs
  gstreamer
  gtk3
  harfbuzz
  harfbuzz-icu
  hyphen
  icu
  lcms2
  libatomic
  libavif
  libdrm
  libegl
  libepoxy
  libgcc
  libgcrypt
  libgl
  libgles
  libjpeg-turbo
  libjxl
  libmanette
  libpng
  libseccomp
  libsecret
  libsoup
  libstdc++
  libsystemd
  libtasn1
  libwebp
  libx11
  libxml2
  libxslt
  mesa
  openjpeg2
  pango
  sqlite
  ttf-font
  wayland
  woff2
  xdg-dbus-proxy
  zlib
)
provides=(
  libjavascriptcoregtk-4.0.so
  libwebkit2gtk-4.0.so
  webkit2gtk
)
conflicts=(webkit2gtk)
# source and sha256sums are populated automatically by publish.sh
source=("webkit2gtk-2.50.6-5-x86_64.pkg.tar.zst::https://github.com/Brodino96/webkit2gtk-automator/releases/download/v2.50.6-5/webkit2gtk-2.50.6-5-x86_64.pkg.tar.zst")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"
  bsdtar -xf "webkit2gtk-2.50.6-5-x86_64.pkg.tar.zst" -C "${pkgdir}"
  rm -f "${pkgdir}"/.PKGINFO "${pkgdir}"/.MTREE "${pkgdir}"/.BUILDINFO
}
