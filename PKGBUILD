# Maintainer: José San Juan <josesj@gmail.com>
pkgname=qfitsview
pkgver=4.0
pkgrel=1
pkgdesc="FITS file viewer based on DPUSER"
url="http://www.mpe.mpg.de/~ott/QFitsView/index.html"
license=("GPL2+")
arch=("x86_64")
source=("http://www.mpe.mpg.de/~ott/QFitsView/download/QFitsView_4.0"
        'qfitsview.png'
        'QFitsView.desktop'
)
md5sums=("cb62ba59c96563303d63c97442485a74"
        'SKIP'
        'SKIP'
)

package() {
  install -Dm755 QFitsView_4.0 "$pkgdir/usr/bin/QFitsView"
  install -Dm644 QFitsView.desktop "$pkgdir/usr/share/applications/QFitsView.desktop"
  install -Dm644 qfitsview.png "$pkgdir/usr/share/pixmaps/qfitsview.png"
}
