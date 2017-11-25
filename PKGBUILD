# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=aws-vault
pkgver=4.1.0
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/99designs/aws-vault/releases/download/v${pkgver}/aws-vault-linux-amd64")
sha256sums=('429d26342f97161bf9f9a1e225a40392399b302b3c2bb15eb262133be5cf33ec')

package() {
  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/aws-vault"
}
