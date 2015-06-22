# Maintainer: Archadept
#   Revision: 2012-01-31

pkgname=ttf-neverworld
_pkgname=neverworld
pkgver=1
pkgrel=1
pkgdesc="A basic decorative ttf font with fantasy symbols by Enoch based on Neale Davidson fonts"
arch=('any')
url="http://nwvault.ign.com/View.php?view=other.detail&id=973"
license=('Free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://nwvault.ign.com/fms/Download.php?id=55468")
md5sums=('70bfc99fb78656318a6847e5127caa06')

package() {
    mv "Download.php?id=55468" "${_pkgname}.ttf"
    mkdir "$srcdir/$_pkgname"
    mv $srcdir/$_pkgname.ttf $srcdir/$_pkgname
    cd "$srcdir/$_pkgname"
    install -Dm644 "$_pkgname.ttf" "$pkgdir/usr/share/fonts/TTF/$_pkgname.ttf"
}
