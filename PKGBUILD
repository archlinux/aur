# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=umleditor
pkgver=3.6.2
pkgrel=4
pkgdesc="UML/INTERLIS-Editor"
arch=('any')
url="http://www.umleditor.org/"
license=('LGPL')
depends=('java-runtime' 'interlis-compiler')
makedepends=('unzip')
source=(http://www.umleditor.org/download/$pkgname-$pkgver.zip 'umleditor')
sha512sums=('47af0aad9d65dfe3ddde2e99264da4b11c5570882103151cdb06c4aaaded25d7410602cf10fdf017b742b72639acd4ad59e8f07b287aada627e586951049d8d7'
            '82f9aa670de6bf2ea2f2f33bfb7f2c7989bdd0fb13b2bf92b684eba039c631c6da806624e1576ce75a6148b2975a31e173859a9b908726626ddef2f8a148dd00')

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp "$srcdir"/$pkgname-$pkgver/*.jar "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/xmirose" "$pkgdir/opt/$pkgname"
  install -D -m755 "$srcdir/umleditor" "$pkgdir/usr/bin/umleditor"
}
