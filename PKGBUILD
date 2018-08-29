# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=aws-vault
pkgver=4.3.0
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/99designs/aws-vault/releases/download/v${pkgver}/aws-vault-linux-amd64")
sha256sums=('3557addb7e57604b476b30c949b27d046b5d33f6973fbf162432b77cbf0d1bc0')

package() {
  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/aws-vault"
}
