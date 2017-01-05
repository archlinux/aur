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
sha256sums=('4368e68aee24c657a4183c1b4d77b8352deb899b8b9db2bbe8509b144f261798'
            'SKIP')
sha384sums=('ee1c4ce631fe1d040896d2a9e34ceb3d9d44e34575b8811ea5f6fe071186f67651a2edb4f0c71c75aaa8734f04dbd3b9'
            'SKIP')
sha512sums=('8d1f4237411fecc7b0d934abfba11255cbe11f513f5586156a38e2290caabac922386af040f709b172c1197655e45263381b57526d052ed0be897011d12db481'
            'SKIP')
validgpgkeys=('DB68D18158C19A535A538524507F8DFE0C99485B')

package() {
tar xJvf ${srcdir}/cinbie-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
