# Maintainer: Mr Kat
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B
# if you've issues with my key, you can download it at http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc and importing it by hand
# just run: eepget http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc && gpg --import mykey.asc
# for it YOU NEED I2P

pkgname=cin-bin
pkgver=5.1
pkgrel=20170101
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
sha256sums=('c660f51cba956b19be47509534ee927aeaeaaea7da41565a4fc0b6844e1ab615'
            'SKIP')
sha384sums=('cb5bf24edd847408e6477a9e6d9cbb7ae2b7292d5c6bfd00a973d6b37dd687fa314eb1c49f74f1760aeb15b6ca65c05e'
            'SKIP')
sha512sums=('7a936c6eaa9169a2a7fbb309573a17b383e64ff25e8ab0db3a35661409ec214ace0bec9b2d2d0f20ca0dda16a33cfea59bba916414bb1ba80aacfacca33fcba5'
            'SKIP')
validgpgkeys=('DB68D18158C19A535A538524507F8DFE0C99485B')

package() {
tar xJvf ${srcdir}/cinbie-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
