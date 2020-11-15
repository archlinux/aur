# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=textlint-rule-ja-space-between-half-and-full-width
pkgver=2.0.2
pkgrel=1
pkgdesc="Textlint rules for half-wide and full-width spaces"
arch=(any)
url="https://github.com/textlint-ja/textlint-rule-preset-ja-spacing"
license=('MIT')
depends=('textlint')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('214ef4888604318746406b0e6468834b4d3680e2c1afa68f15bd0fc4209c35b0')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
