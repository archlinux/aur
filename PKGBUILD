# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=ttf-hardcompound
pkgver=1
pkgrel=1
pkgdesc='Hard Compound font'
arch=('any')
url='http://lefly.vepar.nl/'
license=('CCPL:by-sa')
source=('hard_compound.zip::https://dl.dafont.com/dl/?f=hard_compound')
sha256sums=('20bad7083a3fd50482d7aeea8e3d14d2592dc3b6b207d3f2cb3c09f3662acf79')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" 'Hard Compound.ttf'
}
