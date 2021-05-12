# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=textlint-rule-ja-space-between-half-and-full-width
_gitname=textlint-rule-preset-ja-spacing
pkgver=2.1.2
pkgrel=1
pkgdesc="Textlint rules for half-wide and full-width spaces"
arch=(any)
url="https://github.com/textlint-ja/textlint-rule-preset-ja-spacing"
license=('MIT')
depends=('textlint')
makedepends=('npm')
source=(https://github.com/textlint-ja/textlint-rule-preset-ja-spacing/archive/refs/tags/v$pkgver.zip)
sha256sums=('af6ee1dd5daf1dcc413c07e01552934dc3fefc53901fbb01ae1f4abe164a076e')

package() {
    cd $srcdir/$_gitname-$pkgver
    npm install -g --user root --prefix "$pkgdir"/usr
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
