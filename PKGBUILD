# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=rhythmbox-doubanfm
pkgver=0.007
pkgrel=1
pkgdesc="Douban FM plugin for Rhythmbox music player"
arch=('any')
url="http://code.google.com/p/dbfmplugin/"
license=('GPL')
depends=(rhythmbox)
makedepends=()
optdepends=()
source=("http://dbfmplugin.googlecode.com/files/DoubanFMPlugin_v0_007.tar.gz")
md5sums=('5a08273ca72227fa3ebd75757500ac5b')

package() {
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins"
  cp -R "$srcdir/DoubanFM" "$pkgdir/usr/lib/rhythmbox/plugins/"
  mkdir -p "$pkgdir/usr/share/icons/"
  cp "$srcdir/doubanFM.png" "$pkgdir/usr/share/icons"
}
