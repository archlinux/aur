# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=tar-libarchive
pkgver=99
pkgrel=1
pkgdesc='Dummy package providing tar using libarchive’s implementation instead of GNU’s'
arch=('any')
depends=('libarchive')
provides=('tar')
conflicts=('tar')

package() {
  mkdir -p "$pkgdir/usr/bin"
  ln -s bsdtar "$pkgdir/usr/bin/tar"

  mkdir -p "$pkgdir/usr/share/man/man1"
  ln -s bsdtar.1.gz "$pkgdir/usr/share/man/man1/tar.1.gz"
}
