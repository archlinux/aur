# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=germanium-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Generate image from source code"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/matsuyoshi30/germanium'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ebc7875c5fb1facd735a5b4d97b9911f8c7a2cd169367f7033f3a6de3850d7b8')
sha256sums_i686=('dc0f4ee8b8a3eef82ceaf2a4808a12f8790d4bec4890706cc9cd68ca92c0c791')
sha256sums_aarch64=('5b690c4d3ad2cb7af9d7a05b76bb088de0ffcee711e53352e042e06221258bdd')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 CREDITS -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
