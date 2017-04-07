# Maintainer: Mr Kat
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B
# if you've issues with my key, you can download it at http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc and importing it by hand
# just run: eepget http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc && gpg --import mykey.asc
# for it YOU NEED I2P

pkgname=cin-bin
name=cin
pkgver=5.1
pkgrel=20174
rel=20170329
pkgdesc="Cinelerra ($pkgver) ($pkgrel)"
arch=('x86_64')
url="https://github.com/triceratops1/Arch-cinelerra"
license=('GPL')
depends=('xorg-server' 'xorg-server-utils' 'libpng' 'libxv' 'libva'
'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'libvpx')
makedepends=('yasm' 'nasm' 'cmake'
'libxml2' 'perl-xml-libxml' 'perl-xml-parser' 'python2')
conflicts=('cinelerra-cv' 'cinelerra-heroine' 'cin')
source=(https://cinelerra-cv.org/five/pkgs/arch/cin-5.1-20170329-arch-x86_64.pkg.tar.xz)
sha256sums=('5759f873f998c847a21b4f4c4fd501f76d65d8dd948b2d63507c0f566cfad10e')
sha384sums=('ab4819b004ca52d04b1d1b821af18a122f64d61aa53791b00377e83b829f6c5ec9373fd2abe2f70489b27d8aaf3ee66c')
sha512sums=('ad55476b68d30127dfb7bd2bd231595d32a5740f27af921b51c57e32791ef7100f2826951d8676b7d623c80aa77ab6e1f0d9ef88eb58a45d1a76564adbf8bcd6')

package() {
tar xJvf ${srcdir}/*.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
