pkgname=victus-control-bin
pkgver=0.2.0
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
sha256sums=('b33555f3f732d3f7c53d6148a86f2eac465767a4b60bc7a2d7525725a48c0631')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/victus-control-${pkgver}-x86_64/usr" "${pkgdir}/"
}
