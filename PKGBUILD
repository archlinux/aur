# Maintainer: M0Rf30
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517 

pkgname=soulseekqt
pkgver=20170220
_pkgver=2017-2-20
pkgrel=2
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('i686' 'x86_64')
url="http://www.soulseekqt.net/news/"
license=('custom')
depends=('double-conversion' 'fontconfig' 'libxext' 'libxrender')
source=($pkgname.desktop 
        $pkgname.png )

source_i686=("https://www.dropbox.com/s/m12bxp0bjl6iqo9/SoulseekQt-$_pkgver-Ubuntu17-32bit.tgz")
source_x86_64=("https://www.dropbox.com/s/b8st8jznojbus0b/SoulseekQt-$_pkgver-Ubuntu17-64bit.tgz")

package() {
  rm $srcdir/*.tgz
  install -vDm755 $srcdir/SoulseekQt-$_pkgver* "$pkgdir/usr/bin/$pkgname"
  install -vDm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -vDm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/soulseek.png"
}

md5sums=('810a4200a3c8568257b66b6bdea5c29c'
         '958e9c06bd684e812b6d27515b88b97c')
md5sums_i686=('0793b75e0ea5a554a01739c25740743c')
md5sums_x86_64=('adae8184a3821619fb56a55846ef50b5')
