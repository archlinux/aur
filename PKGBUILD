# Maintainer: blallo@autistici.org

pkgname=article_md
pkgver=0.2.1
pkgrel=1
pkgdesc="An CLI application to parse a web article into readable text."
arch=(x86_64 arm64)
url="https://github.com/aome510/article-md-cli"
license=(MIT)
depends=()
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('9cba4eb5a3c4569cd63fb0263d751248099660daf44277bf9319a69c8ef1f5bc')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
