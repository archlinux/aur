# Maintainer: Anthony Nowell <anowell@gmail.com>

pkgname=algorithmia-bin
pkgver=1.0.0_beta.2
pkgrel=1
pkgdesc="Algorithmia command line interface tools"
arch=('x86_64')
url="https://algorithmia.com/"
license=('MIT')
depends=('')
conflicts=('algorithmia-bin')
source=("https://github.com/algorithmiaio/algorithmia-cli/releases/download/v${pkgver//_/-}/algorithmia_linux64.tar.gz")
md5sums=('6d75ff02fe21d3151944fb6907431c8b')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 algo "$pkgdir/usr/bin/"
}
