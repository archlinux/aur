# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=culmus-fancy-ttf
_commit=d96b5202a5def083bb878aa08b894be8d2cab474
pkgver="20170625"
pkgrel=1
pkgdesc="TrueType version of Hebrew font package culmus-fancy"
arch=('any')
url="http://culmus.sourceforge.net/fancy/index.html"
license=('GPL')
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)

source=("https://github.com/Boruch-Baum/$pkgname/archive/$_commit.zip" $pkgname.install)
sha256sums=('1ddfc3fb3bf4361d0e30877dda2ede98184b8f2d80adee0539296eefbae420aa'
		'09a0c53ca10b0a5a1090a9f71631883fc9da8b08693184721a575c6e1f62bc3c')
install=$pkgname.install

package() {

  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -Dm 644 $srcdir/$pkgname-$_commit/*.ttf $pkgdir/usr/share/fonts/TTF
}
