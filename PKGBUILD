# Maintainer: Michael Egger

pkgname=cin-bin
pkgver=5.1
pkgrel=20160730
pkgdesc="Cinelerra ($pkgver) ($pkgrel)"
arch=('x86_64')
url="http://www.cinelerra-cv.org/five"
license=('GPL')
depends=('xorg-server' 'xorg-server-utils' 'libpng' 'libxv' 'libva'
'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor')
makedepends=('yasm' 'nasm' 'cmake'
'libxml2' 'perl-xml-libxml' 'perl-xml-parser' 'python2')
conflicts=('cinelerra-cv' 'cinelerra-heroine' 'cin')
source=(https://www.cinelerra-cv.org/five/pkgs/arch/cin-$pkgver-$pkgrel-x86_64.pkg.tar.xz)
md5sums=('d1a3579417a72b309a52dad55eecd26d')

package() {
tar xJvf ${srcdir}/cin-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
