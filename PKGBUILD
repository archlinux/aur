# Maintainer: M0Rf30
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517 

pkgname=soulseekqt
pkgver=20160117
_pkgver=2016-1-17
pkgrel=2
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('i686' 'x86_64')
url="http://www.soulseekqt.net/news/"
license=('custom')
depends=( 'libxext' 'fontconfig' 'libxrender' )
source=($pkgname.desktop 
        $pkgname.png )
source_i686=("https://dl.dropboxusercontent.com/u/7226803/SoulseekQt-$_pkgver-32bit.tgz")
source_x86_64=("https://dl.dropboxusercontent.com/u/7226803/SoulseekQt-$_pkgver-64bit.tgz")

package() {
  rm $srcdir/*.tgz
  install -vDm755 $srcdir/SoulseekQt-$_pkgver* "$pkgdir/usr/bin/$pkgname"
  install -vDm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -vDm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/soulseek.png"
}

md5sums=('810a4200a3c8568257b66b6bdea5c29c'
         '256ec24f7ad2d39ac8da0f1c03d3cafe')
md5sums_i686=('906d99b15ed02d0d66981fffeeea1218')
md5sums_x86_64=('c843e748a129e4ad9461280aeb2b957a')
