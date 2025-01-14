# Maintainer: Yaroslav de la Peña Smirnov <yps@yaroslavps.com>

pkgname=kontur-talk
pkgver=3.0.0
pkgrel=1
pkgdesc="Enterprise video conferencing client app"
arch=('x86_64')
url="https://kontur.ru/talk"
license=('custom')
makedepends=('wget' 'tar')
depends=('gtk3' 'nss' 'libxtst' 'xdg-utils' 'util-linux-libs')
provides=('kontur-talk')
source=("https://st.ktalk.host/ktalk-app/linux/ktalk${pkgver}amd64.deb")
sha256sums=('a2c46e3bb96420852ff70224bb34894df1e7fe6d1d19ec9b06dc197b616dd04b')

package() {
	ar -x "${srcdir}/ktalk${pkgver}amd64.deb" data.tar.xz
	tar -xJf data.tar.xz -C "${pkgdir}/"
}
