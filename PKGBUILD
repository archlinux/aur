# Maintainer: numToStr <hello@vikasraj.dev>

pkgname=lemmy-help
pkgver=0.11.0
pkgrel=1
pkgdesc="Emmylua parser and transformer"
arch=('x86_64' 'aarch64')
url=https://github.com/numToStr/lemmy-help
license=('MIT')

source_x86_64=("$pkgname-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$pkgname-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=(SKIP)

source_aarch64=("$pkgname-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=(SKIP)

package() {
    install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin/"
}
