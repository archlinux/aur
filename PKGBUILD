# Maintainer: Yaroslav de la Peña Smirnov <yps@yaroslavps.com>

pkgname=kontur-talk
pkgver=2.11.0
pkgrel=1
pkgdesc="Enterprise video conferencing client app"
arch=('x86_64')
url="https://kontur.ru/talk"
license=('custom')
makedepends=('wget' 'tar')
depends=('gtk3' 'nss' 'libxtst' 'xdg-utils' 'util-linux-libs')
provides=('kontur-talk')
source=("https://st.ktalk.host/ktalk-app/linux/ktalk${pkgver}amd64.deb")
sha256sums=('0edb40bd55b9d2804bd08631720f6f68f040ba30d205d6cbd8010aaad42ba5bf')

package() {
	ar -x "${srcdir}/ktalk${pkgver}amd64.deb" data.tar.xz
	tar -xJf data.tar.xz -C "${pkgdir}/"
}
