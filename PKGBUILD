pkgname=victus-control-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Tray-first monitor and profile controller for HP Victus laptops'
arch=('x86_64')
url='https://github.com/jR4dh3y/HPOmen-linux'
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'glib2'
  'glibc'
  'gtk3'
  'gtk4'
  'json-glib'
  'libayatana-appindicator'
  'libgee'
  'polkit'
)
provides=('victus-control')
conflicts=('victus-control')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/victus-control-${pkgver}-x86_64.tar.zst"
)
sha256sums=('0f3bf2949947081641b4b818d4df631d4e81211259aff77d51df244bd8222e0b')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/victus-control-${pkgver}-x86_64/usr" "${pkgdir}/"
}
