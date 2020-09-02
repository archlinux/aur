# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=textlint-rule-ja-space-between-half-and-full-width
pkgver=2.0.1
pkgrel=1
pkgdesc="Textlint rules for half-wide and full-width spaces"
arch=(any)
url="https://github.com/textlint-ja/textlint-rule-preset-ja-spacing"
license=('MIT')
depends=('textlint')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('3860e20256a2d2d4db244761f29dfc234919988fadda0ec515628f31a2ae758c')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
