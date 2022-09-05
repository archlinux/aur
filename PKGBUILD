# Maintainer: ffqq <shuttara@gmail.com>

pkgname=zaura
pkgver=0.1.2
pkgrel=1
pkgdesc="A bash library for utilizing the AUR inside bash scripts."
arch=('any')
url="https://gitea.com/ffqq/zaura"
license=('GPL3')
provides=("$pkgname")
depends=('git' 'jq' 'pacman')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('95935a5d432acc126af023d4ac0187d5461e36f4669aa98a79ac439a17ed5f6a')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	install -D -m755 "${pkgname}" -t "${pkgdir}/usr/share/${pkgname}"
}
