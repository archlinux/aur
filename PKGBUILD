# Maintainer: Noel <cutie@floofy.dev>
pkgname=utt-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="utt is the universal text transformer"
license=('MIT')
arch=('x86_64')
source=('utt::https://github.com/queer/utt/releases/download/0.0.6/utt')
sha256sums=('69cf0802c01d808d157fc7c9ae66dfff7ad21522a19742a39506eb8968078ed1')
url='https:/github.com/queer/utt'

package() {
  install -Dm0755 "${srcdir}"/utt "${pkgdir}"/usr/local/bin/utt
}
