# Maintainer: Stijn Seghers <stijnseghers@gmail.com>

pkgname=yeganesh-bin
pkgdesc='dmenu with a sense of history (binary release)'
pkgver=2.5
pkgrel=1

url='http://dmwit.com/yeganesh/'
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('dmenu')
source=("http://dmwit.com/yeganesh/yeganesh-${pkgver}-bin.tar.gz")
sha256sums=('0f1051197abac99b9ce3f7073ecff46bf74abf739252127ae1d7b21f66be27be')

package() {
  cd "yeganesh-${pkgver}-bin"

  install -Dm755 yeganesh -t "${pkgdir}/usr/bin"
}
