# Maintainer: Michael Egger

pkgname=cin-bin
pkgver=5.1
pkgrel=20161002
pkgdesc="Cinelerra ($pkgver) ($pkgrel)"
arch=('x86_64')
url="http://www.cinelerra-cv.org/five"
license=('GPL')
depends=('xorg-server' 'xorg-server-utils' 'libpng' 'libxv' 'libva'
'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'libvpx')
makedepends=('yasm' 'nasm' 'cmake'
'libxml2' 'perl-xml-libxml' 'perl-xml-parser' 'python2')
conflicts=('cinelerra-cv' 'cinelerra-heroine' 'cin')
source=(https://bitbucket.org/juanperez89/cinelerra5/downloads/cin-$pkgver-$pkgrel-x86_64.pkg.tar.xz)
md5sums=('3ba47f80b1f1177fcb533fbf521a7491')
sha256sums=('29365db318f93020009599e2c30b6537998ef343390e599e13d99747ec15d975')
sha384sums=('023f9fe4246b5fa16539100a0a7ea87ffdc08228ab4a6e4ee5fdb7214aedeaa50272acb6d5f1526ad112437822bbe7fd')
sha512sums=('2869554e68d53b5118f892ce1945a0b485725e4016fc72270e669893ff1e2713587254b3c1c2143f0e416228e70bb169c62556abc3a73f0bc3a602fdaef7f5ae')

package() {
tar xJvf ${srcdir}/cin-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
