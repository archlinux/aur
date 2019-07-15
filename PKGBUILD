# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=aws-vault
pkgver=4.6.2
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/99designs/aws-vault/releases/download/v${pkgver}/aws-vault-linux-amd64")
sha256sums=('0ed3be765cafd37db7b03bdad11456b47459d2df380314813033582c0e71091c')

package() {
  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/aws-vault"
}
