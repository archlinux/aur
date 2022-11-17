# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=textlint-rule-ja-space-between-half-and-full-width
_gitname=textlint-rule-preset-ja-spacing
pkgver=2.2.0
pkgrel=1
pkgdesc="Textlint rules for half-wide and full-width spaces"
arch=(any)
url="https://github.com/textlint-ja/textlint-rule-preset-ja-spacing"
license=('MIT')
depends=('textlint')
makedepends=('npm')
source=(https://github.com/textlint-ja/textlint-rule-preset-ja-spacing/archive/refs/tags/v$pkgver.zip)
sha256sums=('316dd6b0442f3c4b0c08a6ba29113e139f96f31d58b080543493caddd716a9f5')

package() {
    cd $srcdir/$_gitname-$pkgver
    npm install -g --user root --prefix "$pkgdir"/usr
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
