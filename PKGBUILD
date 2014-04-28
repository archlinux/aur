# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Yannik Stein <yannik.stein [at] gmail.com>
# Contributor: Dan Serban
# Contributor: flying-sheep
# Contributor: Liu Chang <goduck777@gmail.com>

pkgname=pdftk-bin
pkgver=2.01_1
pkgrel=4
pkgdesc="Swiss army knife for PDFs. Built from binary executables available in Debian repositories."
url=http://www.pdfhacks.com/pdftk
arch=(i686 x86_64)
license=(GPL)
depends=(libgcj gcc-libs)
provides=(pdftk)
conflicts=(pdftk pdfchain-all-inclusive)

if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha512sums=(8291e58968794ba1b3836ce1a10fb5a21110386965c07c0a06525d90f5eef273664287fbffe6e832aa4711bef12e42b95d06801ca283731e2c7e4829f8944bac)
else
  _debarch=amd64
  sha512sums=(a7c11fb223728dda97260695b332b7c1c7fe3e460a0da604d90301775e0c96a54e7a0abbde2bb926305f36e8acd7ab3bd6ab6be84abf4d5541c1b6e46cefb172)
fi
source=(http://ftp.debian.org/debian/pool/main/p/pdftk/pdftk_${pkgver//_/-}_${_debarch}.deb)

package() {
  tar -xf data.tar.gz -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 et:
