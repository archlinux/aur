# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=malias
pkgver=1.2.5
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases"
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6d99174f3df1ee810067bc054865c99f7f378223cb960c8388611871a955770a')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
