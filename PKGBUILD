# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=seqcombgo-bin
_pkgname=SeqCombGo
pkgver=0.0.1
pkgrel=1
pkgdesc="Sequence Combination tool written in Golang"
arch=('x86_64')
url="https://github.com/MalacoLab/SeqCombGo"
license=('GPL')
provides=('seqcombgo')
conflicts=('seqcombgo-git' 'seqcombgo')
source=(https://github.com/MalacoLab/SeqCombGo/releases/download/${pkgver}/SeqCombGo_linuxamd64)
sha256sums=('64533ab3e0df5f2d9e757af79a8657e9189f95505e0e826f511d486c88eb4796')
package() {
  install -Dm755 ${_pkgname}_linuxamd64 $pkgdir/usr/bin/$_pkgname
}
