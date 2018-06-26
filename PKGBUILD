# Maintainer: Devin J. Pohly <djpohly+arch@djpohly.com>

pkgname=extraf
pkgver=14.2
pkgrel=1
pkgdesc="Extra console fonts from Slackware"
arch=(any)
makedepends=(tar)
url="http://www.slackware.com/"
license=('GPL')
source=("http://slackware.cs.utah.edu/pub/slackware/slackware-$pkgver/source/a/kbd/sources/extraf.tgz")
sha256sums=('b4e03dd5ecbec080106bceb39e6d44fed7eefff2d81e8cc39aebfa8a6b4d6915')
noextract=(extraf.tgz)

package() {
  tar -xzf "$srcdir/extraf.tgz" -C "$pkgdir"
}

# vim:set ts=2 sw=2 et:
