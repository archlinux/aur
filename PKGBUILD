# Maintainer: Devin J. Pohly <djpohly+arch@djpohly.com>

pkgname=extraf
pkgver=13.0
pkgrel=1
pkgdesc="Extra console fonts from Slackware"
arch=(any)
makedepends=(tar)
url="http://www.slackware.com/"
license=('GPL')
source=("http://slackware.cs.utah.edu/pub/slackware/slackware-$pkgver/source/a/kbd/sources/extraf.tgz")
md5sums=('7b129c88a633ed325261554691add25c')

# No need to extract this twice - the "build" is just extracting to $pkgdir
noextract=(extraf.tgz)

build() {
  tar xzf "$srcdir/extraf.tgz" -C "$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
