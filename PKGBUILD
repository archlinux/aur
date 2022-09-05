# Maintainer: ffqq <shuttara@gmail.com>

pkgname=zaura
pkgver=0.1.3
pkgrel=1
pkgdesc="A bash library for utilizing the AUR inside bash scripts."
arch=('any')
url="https://gitea.com/ffqq/zaura"
license=('GPL3')
provides=("$pkgname")
depends=('git' 'jq' 'pacman')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc40df87cc0ead7c7247d01c634b2e1d818a8e0419f06b7b3209b11905255410')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	install -D -m755 "${pkgname}" -t "${pkgdir}/usr/share/${pkgname}"
}
