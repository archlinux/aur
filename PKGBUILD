# Maintainer: Yaroslav de la Peña Smirnov <yps@yaroslavps.com>

pkgname=kontur-talk
pkgver=3.5.1
pkgrel=1
pkgdesc="Enterprise video conferencing client app"
arch=('x86_64')
url="https://kontur.ru/talk"
license=('custom')
makedepends=('wget' 'tar')
depends=('gtk3' 'nss' 'libxtst' 'xdg-utils' 'util-linux-libs')
provides=('kontur-talk')
source=("https://st.ktalk.host/ktalk-app/linux/ktalk${pkgver}amd64.deb")
sha256sums=('c7797cd15bf9800e763bfb62ab163dc7155bcfbc0a2b1bf45b7769e9da1d1f1f')

package() {
	ar -x "${srcdir}/ktalk${pkgver}amd64.deb" data.tar.xz
	tar -xJf data.tar.xz -C "${pkgdir}/"
}
