# Maintainer: Amolith <amolith@secluded.site
pkgname=invoice-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Command line invoice generator"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/maaslalani/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('e78a1e7b71d2562044b6e894ed67eeee2fa9bb299e0ec6bd11cb5e074bbe4728')

source_i686=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('f97a9048ed07258915aea0a182b33759818c7718d433121ec76091ea77208488')

source_aarch64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('0e0e2f9afd61c1db6431178dfee3e039c385cf8a9fb4ed47c2df691280395b80')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
