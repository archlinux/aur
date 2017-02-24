# Maintainer: Mr Kat
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B
# if you've issues with my key, you can download it at http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc and importing it by hand
# just run: eepget http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc && gpg --import mykey.asc
# for it YOU NEED I2P

pkgname=cin-bin
pkgver=5.1
pkgrel=201731
pkgdesc="Cinelerra ($pkgver) ($pkgrel)"
arch=('x86_64')
url="https://github.com/triceratops1/Arch-cinelerra"
license=('GPL')
depends=('xorg-server' 'xorg-server-utils' 'libpng' 'libxv' 'libva'
'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'libvpx')
makedepends=('yasm' 'nasm' 'cmake'
'libxml2' 'perl-xml-libxml' 'perl-xml-parser' 'python2')
conflicts=('cinelerra-cv' 'cinelerra-heroine' 'cin')
source=(https://cinelerra-cv.org/five/pkgs/arch/cin-$pkgver-20170131-$arch.pkg.tar.xz
)
sha256sums=('4eabb0194240fc5d0021d0702d96fc940db8e9b18316a8305719c39a96a9de4e')
sha384sums=('f1fb3e26559886ea9ec296411249c10c4962252d4287ebd23ff58c96e253f43316ffe73069714b71aa2269a3bef6e650')
sha512sums=('144d5433b8fc56096c87c2a4e8e07df4f0d61e4e44c6044f8d8efab2a022a96a7b8a5d4608fa79ff635cce8f5705fdb21fcbdbaba97b4f6b5684123247af769e')
package() {
tar xJvf ${srcdir}/cin-${pkgver}-20170131-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
