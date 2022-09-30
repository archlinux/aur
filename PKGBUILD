# Maintainer: numToStr <hello@vikasraj.dev>

pkgname=lemmy-help
pkgver=0.7.0
pkgrel=2
pkgdesc="A CLI to generate vimdoc from emmylua"
arch=('x86_64' 'aarch64')
url=https://github.com/numToStr/lemmy-help
license=('MIT')

source_x86_64=("$pkgname-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$pkgname-x86_64-unknown-linux-gnu.tar.gz")
md5sums_x86_64=(SKIP)

source_aarch64=("$pkgname-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$pkgname-aarch64-unknown-linux-gnu.tar.gz")
md5sums_aarch64=(SKIP)

package() {
    install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin/"
}
