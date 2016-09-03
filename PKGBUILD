# Maintainer: Michael Egger

pkgname=cin-bin
pkgver=5.1
pkgrel=20160831
pkgdesc="Cinelerra ($pkgver) ($pkgrel)"
arch=('x86_64')
url="http://www.cinelerra-cv.org/five"
license=('GPL')
depends=('xorg-server' 'xorg-server-utils' 'libpng' 'libxv' 'libva'
'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'libvpx')
makedepends=('yasm' 'nasm' 'cmake'
'libxml2' 'perl-xml-libxml' 'perl-xml-parser' 'python2')
conflicts=('cinelerra-cv' 'cinelerra-heroine' 'cin')
source=(https://www.cinelerra-cv.org/five/pkgs/arch/cin-$pkgver-$pkgrel-x86_64.pkg.tar.xz)
sha512sums=('4f116fda04cdfd2f5549b10322d032f69663ab266e5295d6dd268f199ac5f7805b1417e7b3601f8869371a21f471073e8bcc2d9961adb16cb08de7c6090ea890')

package() {
tar xJvf ${srcdir}/cin-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
