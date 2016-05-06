# $Id: PKGBUILD 117261 2014-08-12 09:36:54Z bgyorgy $
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Roberto Viola <cagnulein@gmail.com>

pkgname=ttytter
pkgver=2.1.00
pkgrel=4
pkgdesc="A multi-functional, command-line twitter client"
arch=('any')
url="http://www.floodgap.com/software/ttytter/"
license=('custom:FFSL')
depends=('perl')
optdepends=('perl-term-readline-ttytter: readline support')
source=(http://www.floodgap.com/software/ffsl/license.txt
        $pkgname-$pkgver.txt::http://www.floodgap.com/software/$pkgname/dist2/$pkgver.txt)
sha256sums=('42c576fcacb5bd6c8f8e64c479b0f8e4445c7e6c9ac013485c51b8f05f2352fd'
            '86c6e7767c65e3179d4ed6368e27df5c4b200285207c3df3164c5a84a73517b1')

build() {
  return 0
}

package() {
  cd "$srcdir"
  install -Dm755 $pkgname-$pkgver.txt "$pkgdir/usr/bin/$pkgname"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
