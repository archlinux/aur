# Maintainer: Kisaragi Fuurin <NicoleSandwich@outlook.com>
pkgname=vocal2midi-bin
pkgver=0.3.0
pkgrel=1
_v2m_source_date_epoch=1786708205
pkgdesc="Singing voice to MIDI desktop application with native Rust inference workers"
arch=('x86_64')
url="https://github.com/AntheaLaffy/Vocal2Midi-rs"
license=('Apache-2.0')
depends=(
  'cairo'
  'dbus'
  'libgcc'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=("vocal2midi=${pkgver}")
conflicts=('vocal2midi')
options=('!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/vocal2midi-runtime-${pkgver}-${CARCH}.tar.zst")
sha256sums_x86_64=('5be1c5c3f1b09e856f3bd291b818a53ca17355f44668e9e7bc496a082d2d2123')

package() {
  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
}
