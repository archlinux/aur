# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=icewm-themes
pkgver=1.2.26
pkgrel=4
pkgdesc="icewm themes"
arch=('any')
license=("GPL2")
url=http://www.debian.org
depends=(icewm)
source=(http://ftp.debian.org/debian/pool/main/i/icewm-themes/icewm-themes_$pkgver.orig.tar.gz)
md5sums=('c0fd0de59e6f74c9c86c0bc334eb6b9e')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/share/icewm/themes
  cp -r "$srcdir"/$pkgname-$pkgver/* "$pkgdir"/usr/share/icewm/themes/
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
}
