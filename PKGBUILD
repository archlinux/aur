# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=dangerdeep-data
pkgver=0.3.0
pkgrel=6
pkgdesc='Dangerdeep (submarine simulator) data files'
arch=('any')
url='https://dangerdeep.sourceforge.net/'
license=('GPL' 'CCPL')
source=("https://downloads.sourceforge.net/sourceforge/dangerdeep/dangerdeep-data-$pkgver.zip")
sha256sums=('00412a4f8f571a9291df48fa40fbbe846680b4fcb1de2f168539b1606cb4fb81')

package() {
  install -d "$pkgdir/usr/share"
  cp -r data "$pkgdir/usr/share/dangerdeep"
}

# vim: ts=2 sw=2 et:
