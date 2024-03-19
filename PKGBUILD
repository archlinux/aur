# Maintainer: Yaroslav de la Peña Smirnov <yps@yaroslavps.com>

pkgname=kontur-talk
pkgver=2.10.0
pkgrel=1
pkgdesc="Enterprise video conferencing client app"
arch=('x86_64')
url="https://kontur.ru/talk"
license=('custom')
makedepends=('wget' 'tar')
depends=('gtk3' 'nss' 'libxtst' 'xdg-utils' 'util-linux-libs')
provides=('kontur-talk')
source=("https://st.ktalk.host/ktalk-app/linux/ktalk${pkgver}amd64.deb")
sha256sums=('416d50b7a8c66d8d4a41349d1607aea33d4e4ecdd307825f20dca7c25d30d34e')

package() {
	ar -x "${srcdir}/ktalk${pkgver}amd64.deb" data.tar.xz
	tar -xJf data.tar.xz -C "${pkgdir}/"
}
