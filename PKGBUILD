# Maintainer: Michael Egger
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B
pkgname=cin-bin
pkgver=5.1
pkgrel=20161030
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
cinbie-5.1-20161030-x86_64.pkg.tar.xz.sig
)
sha256sums=('4dd15a6850033192327d313f98d56d8c1fffca5c7208aa8cc5af4aa5bae290bb'
            'SKIP')
sha384sums=('66618e133ac23b9096b8795004ce77039a7b76f9937b18b84aefdd18dcb7d82b05f8f12cb87c2029068f35946f59b9b8'
            'SKIP')
sha512sums=('d1b756977fb7788ce1eae6ec8632ffed255cd3c3f8e4d781d3761fa0715ddebbed7ef385dc224e816f5f3ec07ef3e008862eb39ab9971a331e099509b56a42f9'
            'SKIP')
validgpgkeys=('DB68D18158C19A535A538524507F8DFE0C99485B')

package() {
tar xJvf ${srcdir}/cinbie-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
