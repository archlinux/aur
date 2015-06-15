#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: SiD/sidious <miste7@web.de>

pkgname=splashy-theme-darch
pkgver=0.4.1
pkgrel=5
pkgdesc="Splashy theme for ArchLinux"
license=('custom')
arch=('any')
url="https://sourceforge.net/projects/splashy-darch/"
depends=('splashy')
conflicts=('splashy-themes')
source=(http://sourceforge.net/projects/splashy-darch/files/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('a1b25401a341d23d2df2468638b631e17586d9d11d064c9930e8d23e154631f328b8d54832d1ebb175d801bf7d6b50033cdae1dc7eafadb888fa4bb64328865a')

package() {
  cd $srcdir/$pkgname-$pkgver
  
  install -m 644 -D darch-white.png $pkgdir/usr/share/splashy/themes/darch-white/background.png
  install -m 644 -D theme-white.xml $pkgdir/usr/share/splashy/themes/darch-white/theme.xml
  install -m 644 -D FreeSans.ttf $pkgdir/usr/share/splashy/themes/darch-white/FreeSans.ttf
  install -m 644 -D darch-white-43.png $pkgdir/usr/share/splashy/themes/darch-white-43/background.png
  install -m 644 -D theme-white-43.xml $pkgdir/usr/share/splashy/themes/darch-white-43/theme.xml
  install -m 644 -D FreeSans.ttf $pkgdir/usr/share/splashy/themes/darch-white-43/FreeSans.ttf
  install -m 644 -D darch-grey.png $pkgdir/usr/share/splashy/themes/darch-grey/background.png
  install -m 644 -D theme-grey.xml $pkgdir/usr/share/splashy/themes/darch-grey/theme.xml
  install -m 644 -D FreeSans.ttf $pkgdir/usr/share/splashy/themes/darch-grey/FreeSans.ttf
  install -m 644 -D darch-grey-43.png $pkgdir/usr/share/splashy/themes/darch-grey-43/background.png
  install -m 644 -D theme-grey-43.xml $pkgdir/usr/share/splashy/themes/darch-grey-43/theme.xml
  install -m 644 -D FreeSans.ttf $pkgdir/usr/share/splashy/themes/darch-grey-43/FreeSans.ttf

  # Install the license.
  install -m 755 -d $pkgdir/usr/share/licenses/$pkgname
  install -m 644 -D LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}
