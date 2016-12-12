# Maintainer: Michael Egger
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B
pkgname=cinbie
pkgver=5.1
pkgrel=20161130
pkgdesc="Cinelerra ($pkgver) ($pkgrel)"
arch=('x86_64')
url="http://www.cinelerra-cv.org/five"
license=('GPL')
depends=('xorg-server' 'xorg-server-utils' 'libpng' 'libxv' 'libva'
'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'libvpx')
makedepends=('yasm' 'nasm' 'cmake'
'libxml2' 'perl-xml-libxml' 'perl-xml-parser' 'python2')
conflicts=('cinelerra-cv' 'cinelerra-heroine' 'cin')
source=(https://bitbucket.org/juanperez89/cinelerra5/downloads/cinbie-$pkgver-$pkgrel-x86_64.pkg.tar.xz
cinbie-$pkgver-$pkgrel-x86_64.pkg.tar.xz.sig
)
sha256sums=('aa0942059d228e3ea26ae80ac1d89039ba59c9586ce4447a28680209ed2993af'
            'SKIP')
sha384sums=('202aa8d8187c5a4de2cc30749b37fc5665042d67f74302837856edadc3221a6427094ac8f39ef4762b0236da07b25dab'
            'SKIP')
sha512sums=('ae5ca9f1bde7d698294c0c9165c2343895fa83cbe742674d6a2145b6fb8a773dd11e646cc1956757a1444c04b68b87aa0341a41b8a516fcad924eb3052eeecb6'
            'SKIP')
validgpgkeys=('DB68D18158C19A535A538524507F8DFE0C99485B')

package() {
tar xJvf ${srcdir}/cin-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
