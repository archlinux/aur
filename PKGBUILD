# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=aws-vault
pkgver=4.2.1
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/99designs/aws-vault/releases/download/v${pkgver}/aws-vault-linux-amd64")
sha256sums=('dc054509b608d645a3d5690d7d486c8fff3b349048e83062a302a3ba66a8e9f6')

package() {
  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/aws-vault"
}
