# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=javagnutar
pkgver=1.1.4
pkgrel=1
pkgdesc="Java library for GNU Tar archives"
arch=('any')
url="http://code.google.com/p/javagnutar/"
license=('Apache')
depends=('java-runtime>=1.5')
makedepends=('unzip' 'wget')

_url="http://javagnutar.googlecode.com/files/javagnutar-1.1.4.zip"

build() {
  cd "$srcdir"
  wget "$_url"
  unzip javagnutar-1.1.4.zip
}

package() {
  cd "$srcdir/"
  install -d "$pkgdir/usr/lib/"
  install -m 755 activation.jar "$pkgdir/usr/lib/"
  install -m 755 javagnutar.jar "$pkgdir/usr/lib/"
}
