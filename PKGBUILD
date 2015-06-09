# Maintainer: dale mallion <dale.mallion@gmail.com>
pkgname=mac-os-lion-cursors
pkgver=2
pkgrel=1
pkgdesc="MAC OS X Lion Cursor Theme by MB0SS"
arch=('any')
url="http://mbossg.deviantart.com/#/d4yqyle"
license=('unknown')
source=('https://dl.dropbox.com/s/x3oat2kxz47hfqv/mac-os-lion-cursors.tar.gz')
md5sums=('cf5b06ca4307eee5e272267a2289c1ef')

build() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/share/icons

  cp -rf $pkgname "${pkgdir}"/usr/share/icons/

  chmod 755 -R "$pkgdir"/usr/share/icons
}
