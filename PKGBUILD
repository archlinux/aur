# Maintainer: Rastislav <barlik.arch at gmx dot com>
# Contributor: hbdee <hbdee.arch@gmail.com>
# Contributor: MagicFish1990 <magicfish1990@gmail.com>

pkgname=wyabdcrealpeopletts
pkgver=0.1
pkgrel=3
pkgdesc="An audio collection of english words (can be used by stardict and qstardict)."
arch=('any')
url="http://stardict-4.sourceforge.net/"
license=('GPL')
source=('http://sourceforge.net/projects/stardict-4/files/WyabdcRealPeopleTTS/WyabdcRealPeopleTTS.tar.bz2')
md5sums=('374562042e7902c39b33365958a4c4ed')

package() {
    install -d -m755 "$pkgdir/usr/share"
    mv "$srcdir/WyabdcRealPeopleTTS" "$pkgdir/usr/share"
}

# vim:set ts=2 sw=2 et:
