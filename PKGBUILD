# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fopnu
pkgver=1.48
pkgrel=1
pkgdesc='A new and powerful P2P File Sharing System'
arch=('x86_64')
url='https://www.fopnu.com'
license=("custom:${pkgname}")
depends=('gtk2' 'dbus-glib')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://download2.fopnu.com/download/fopnu_${pkgver}-1_amd64.deb"
        'LICENSE')
sha256sums=('966a29b5c36146dd902153e25e914fc2b0eeb96a9fe62ce664e96b1778f58667'
            'SKIP')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: