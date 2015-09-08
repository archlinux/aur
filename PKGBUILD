# Maintainer: Anthony Nowell <anowell@gmail.com>

pkgname=algorithmia-bin
pkgver=1.0.0_beta.1
pkgrel=1
pkgdesc="Algorithmia command line interface tools"
arch=('x86_64')
url="https://algorithmia.com/"
license=('MIT')
depends=('')
conflicts=('algorithmia-bin')
source=("https://github.com/algorithmiaio/algorithmia-cli/releases/download/v${pkgver//_/-}/algorithmia_linux64.tar.gz")
md5sums=('75421e5814f8b1c17a20c760d653a9be')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 algo "$pkgdir/usr/bin/"
}
