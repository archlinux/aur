# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.11.3
pkgrel=3
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
source=(https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/freedoom-$pkgver.zip{,.asc}
        https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/freedm-$pkgver.zip{,.asc}
        https://chungy.keybase.pub/freedoom-dist.tar.gz)
sha512sums=('c67fc69bca87cba2ba40b91f578724feaabbd6cd64c6845fa567d6901b7a9e3145185011731c677a71f7b5a6f8707855fb573c0c09b6d47fef83b1577b211816'
            'SKIP'
            '263f126e519a883b828b4f321363fe0f8c557ae58b76c6b3e28aa60e86c15fcc78c866bf003fc523276cefbb431023de64f09b026e85b0a0c7c85a88d1f47cd0'
            'SKIP'
            '04d97d60e39cf25a4728bc7bca91fe2ab9e050715f1975be4b3bc5b8c917b7f5977c5cfdd2e5ab5b437f653fdce9edc401c74b2ea232a31573c3324e62c7644e')
validpgpkeys=('99459CE2770037FF5566EB4B8649B37607A08042')

build() {
  true
}

package_freedm() {
  install -Dm644 $pkgname-$pkgver/$pkgname.wad "$pkgdir/usr/share/games/doom/$pkgname.wad"
  install -Dm644 $pkgname-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 $pkgbase-dist/$pkgname.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 $pkgbase-dist/$pkgname.appdata.xml "$pkgdir/usr/share/appdata/$pkgname.appdata.xml"
  install -Dm644 $pkgbase-dist/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgbase-dist/$pkgname.png "$pkgdir/usr/share/icons/$pkgname.png"
  install -Dm755 $pkgbase-dist/$pkgname "$pkgdir/usr/bin/$pkgname"
}

package_freedoom1() {
  install -Dm644 $pkgbase-$pkgver/$pkgname.wad "$pkgdir/usr/share/games/doom/$pkgname.wad"
  install -Dm644 $pkgbase-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 $pkgbase-dist/$pkgname.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 $pkgbase-dist/$pkgname.appdata.xml "$pkgdir/usr/share/appdata/$pkgname.appdata.xml"
  install -Dm644 $pkgbase-dist/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgbase-dist/$pkgname.png "$pkgdir/usr/share/icons/$pkgname.png"
  install -Dm755 $pkgbase-dist/$pkgname "$pkgdir/usr/bin/$pkgname"
}

package_freedoom2() {
  provides=('freedoom')

  install -Dm644 $pkgbase-$pkgver/$pkgname.wad "$pkgdir/usr/share/games/doom/$pkgname.wad"
  install -Dm644 $pkgbase-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 $pkgbase-dist/$pkgname.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 $pkgbase-dist/$pkgname.appdata.xml "$pkgdir/usr/share/appdata/$pkgname.appdata.xml"
  install -Dm644 $pkgbase-dist/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgbase-dist/$pkgname.png "$pkgdir/usr/share/icons/$pkgname.png"
  install -Dm755 $pkgbase-dist/$pkgname "$pkgdir/usr/bin/$pkgname"
}
