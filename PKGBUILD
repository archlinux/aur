# Maintainer: Yaroslav de la Peña Smirnov <yps@yaroslavps.com>

pkgname=kontur-talk
pkgver=3.1.0
pkgrel=1
pkgdesc="Enterprise video conferencing client app"
arch=('x86_64')
url="https://kontur.ru/talk"
license=('custom')
makedepends=('wget' 'tar')
depends=('gtk3' 'nss' 'libxtst' 'xdg-utils' 'util-linux-libs')
provides=('kontur-talk')
source=("https://st.ktalk.host/ktalk-app/linux/ktalk${pkgver}amd64.deb")
sha256sums=('02634c8037164c15f6e3b040198ba534c063c080c2330a6cb28efecded9dd1b6')

package() {
	ar -x "${srcdir}/ktalk${pkgver}amd64.deb" data.tar.xz
	tar -xJf data.tar.xz -C "${pkgdir}/"
}
