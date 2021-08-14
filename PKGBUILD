# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=germanium-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Generate image from source code"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/matsuyoshi30/germanium'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('27e8e61b2ba51ffe1b6f33b12b7a37ec4473d38a7c31191c517c916d46ef1c6c')
sha256sums_i686=('a7994c1404d0c9c839b2548f1a0cd4cf71210d553a96b8f988312c9e8fbe1255')
sha256sums_aarch64=('cb567dada6191444afd2049a84457cb06d32063011b9d5b655e0549087c98240')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 CREDITS -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
