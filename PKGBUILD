# Maintainer: wjhandley
pkgname=mudslide
pkgver=0.26.0
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('2d02a1e94fe3d197ce9314f9e7bb220cc46301c5bf705db54831404d1b628693')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
}

