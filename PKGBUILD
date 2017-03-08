# Maintainer: Mr Kat
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B
# if you've issues with my key, you can download it at http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc and importing it by hand
# just run: eepget http://ah4r4vzunzfa67atljlbrdgtg3zak5esh7ablpm6xno6fhqij35q.b32.i2p/sha1/c6c9d9bfe00b506d9ec0c158a61f7ca1b3cec855/mykey.asc && gpg --import mykey.asc
# for it YOU NEED I2P

pkgname=cin-bin
name=cin
pkgver=5.1
pkgrel=201731
rel=20170228
pkgdesc="Cinelerra ($pkgver) ($pkgrel)"
arch=('x86_64')
url="https://github.com/triceratops1/Arch-cinelerra"
license=('GPL')
depends=('xorg-server' 'xorg-server-utils' 'libpng' 'libxv' 'libva'
'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'libvpx')
makedepends=('yasm' 'nasm' 'cmake'
'libxml2' 'perl-xml-libxml' 'perl-xml-parser' 'python2')
conflicts=('cinelerra-cv' 'cinelerra-heroine' 'cin')
source=(https://cinelerra-cv.org/five/pkgs/arch/${name}-${pkgver}-${rel}-arch-${arch}.pkg.tar.xz
)
sha256sums=('3cda03c60369d15933c8294994a5ad42c0ee6bbff6cf4b04aaa19fe9b6d212c8')
sha384sums=('906b9a2a484a9c98d7973b28681cb4d855ac2feb9fd2217b152b38a81165a6d694c47d6778db5e0bcd34eb8304a7f4b4')
sha512sums=('220730e22899813a86d0715ceff425a520201ab5f1488337983f1754d2762d80f0aba63db254ed5df5bdb6772b7f8f69a142902289242dbf608d1234484b0452')
package() {
tar xJvf ${srcdir}/cin-${pkgver}-20170131-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
