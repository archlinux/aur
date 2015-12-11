# Maintainer: lily wilson <hotaru@thinkindifferent.net>
pkgname=ralcgm
pkgver=3.50
pkgrel=0
pkgdesc="a program to interpret Computer Graphics Metafiles."
arch=('i686' 'x86_64')
url="http://www.agocg.ac.uk/train/cgm/ralcgm.htm"
license=('')
source_i686=("http://ftp.heanet.ie/disk1/pld-linux/pool/r/$pkgname/$pkgname-$pkgver-3.i686.rpm")
source_x86_64=("http://ftp.heanet.ie/disk1/pld-linux/pool/r/$pkgname/$pkgname-$pkgver-3.amd64.rpm")
sha256sums_i686=('53806ade66ab739378ee11bc5ddb7eeed189a6624b76feb4451df1e8a6a3fed0')
sha256sums_x86_64=('f2c6ce236e506b4346ab1c1ac5bbc3cd8054e88cd84f2fb81ae95ea87be3abd3')

build() {
  cd $srcdir
  rpmextract.sh "$pkgname-$pkgver-3.$arch.rpm"
}

package() {
  cd $srcdir
  install -Dm755 ./usr/bin/ralcgm $pkgdir/usr/bin/ralcgm
  cp -r ./usr/share $pkgdir/usr/share
}
