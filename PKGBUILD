# Maintainer: Andrew Lin <andrewlin16 at gmail dot com>

pkgname=zxtune-bin
pkgver=r5110
pkgrel=1
pkgdesc="Portable toolkit for ZX-Spectrum music playing (pre-compiled)"
arch=(x86_64)
url="https://zxtune.bitbucket.io/"
license=(GPL3)
depends=(boost-libs gcc-libs qt5-base zlib)
optdepends=(
  'alsa-lib: for ALSA output support'
  'lame: for conversion to .mp3 format'
  'libvorbis: for conversion to .ogg format'
  'flac: for conversion to .flac format'
  'curl: for accessing data via network schemes'
)
provides=(zxtune)
conflicts=(zxtune-git)
source=("https://storage.zxtune.ru/builds/public/${pkgver}/linux/x86_64/zxtune_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('0798f8ca28e7143cba475bdc32fc627e00506a2e7ddab18a5b365f334331c345')

package() {
  cp -r usr "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
