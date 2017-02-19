# Maintainer: Vladimir Anderer <openproject dot va providedBy gmail dot com>
# Script Author: Michael Moser
pkgname=img-archive
pkgver=0.1
pkgrel=1
pkgdesc="Tool to maintain a picture archive. Images are checked and a checksum is calculated for later checks."
arch=('any')
url=""
license=('custom')
groups=()
depends=('perl-image-exiftool' 'jpeginfo' 'openssl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://raw.githubusercontent.com/MoserMichael/cstuff/master/img-archive/img-archive.pl' 'https://raw.githubusercontent.com/MoserMichael/cstuff/master/LICENSE.txt' 'img-archive.1')
noextract=()
md5sums=('a8ffa0b1ae8d9f64da0a6af451ed5411'
         'c0b9f41ba2afac75fcfe40673b4838c5'
         'b7b5abbfe382e8aa5c9c69c91fe2489b')

package() {
  install -D -m755 img-archive.pl "${pkgdir}/usr/bin/img-archive"
  install -D -m644 img-archive.1 "${pkgdir}/usr/share/man/man1/img-archive.1"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
