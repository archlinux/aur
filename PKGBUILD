# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=germanium-bin
pkgver=1.2.3
pkgrel=2
pkgdesc="Generate image from source code"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/matsuyoshi30/germanium'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8d543d93358f5ede30df536d910329d8994daf09292eddf3c882038e564db4d0')
sha256sums_i686=('cae6079997599135566c6eead806c226fce5e606f72aff92c28f5826026bbbf0')
sha256sums_aarch64=('18b7e7bbe6a262e32bea2aad2c4f9f164e2ce223acb947f99ef6dc89fe97069d')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 CREDITS -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
