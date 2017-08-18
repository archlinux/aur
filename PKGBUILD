# Maintainer: chengen12 <googledrive70@aaedu.edu.pl>

pkgname=fcitx-xxm
pkgver=0.2.2
pkgrel=1
pkgdesc='XiaoXima for fcitx.'
arch=('any')
license=('GPL')
depends=('fcitx')
url=''
source=("git://github.com/chengen12/fcitx-xxm.git")
md5sums=('SKIP')

package() {
  cd $pkgname
  mkdir -p "$pkgdir/usr/share/fcitx/table"
  install -Dm644 xxm.png "$pkgdir"/usr/share/fcitx/imicon/xxm.png
  install -Dm644 xxm.conf xxm.mb "$pkgdir/usr/share/fcitx/table"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
