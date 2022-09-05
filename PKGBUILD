# Maintainer: ffqq <shuttara@gmail.com>

pkgname=zaura
pkgver=0.1.4
pkgrel=1
pkgdesc="A bash library for utilizing the AUR inside bash scripts."
arch=('any')
url="https://gitea.com/ffqq/zaura"
license=('GPL3')
provides=("$pkgname")
conflicts=("zaura-git")
depends=('git' 'jq' 'pacman')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1a990c6f22c4ab806afc4546dcf3055b4c81431dc015076879d222ae81449b18')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	install -D -m755 "${pkgname}" -t "${pkgdir}/usr/share/${pkgname}"
}
