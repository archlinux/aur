# Maintainer: Archadept
#   Revision: 2020-07-10

pkgname=ttf-14minute
_pkgname=14minute
pkgver=1
pkgrel=1
pkgdesc="A basic decorative ttf font"
arch=('any')
url="http://www.coolfonts.info/font-23-14_minutes.php"
license=('Unknown proprietary')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-util')
install=ttf.install
source=("http://www.coolfonts.info/download-23-14_minutes.zip")
md5sums=('1839eec4972435ad028254082cc16b82')

package() {
    mkdir "$srcdir/$_pkgname"
    mv $srcdir/$_pkgname.ttf $srcdir/$_pkgname
    cd "$srcdir/$_pkgname"
    install -Dm644 "$_pkgname.ttf" "$pkgdir/usr/share/fonts/TTF/$_pkgname.ttf"
}
