# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=aws-vault
pkgver=4.0.0
pkgrel=2
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/99designs/aws-vault/releases/download/v${pkgver}/aws-vault-linux-amd64")
sha256sums=('5d0f2bcd28df5090e187c8cc3abe9bfb9c47785b1562b20f5ca9cf2c24ab438d')

package() {
  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/aws-vault"
}
