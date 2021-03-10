# Maintainer: lmartinez-mirror
# Contributor: donbex <ap dot m at runbox dot com>
pkgname=as-tree-bin
_pkgname=${pkgname%-bin}
pkgver=0.12.0
pkgrel=1
pkgdesc="Print a list of paths as a tree of paths"
arch=('x86_64')
url="https://github.com/jez/as-tree"
license=('custom:BOML')
depends=('gcc-libs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.zip::$url/releases/download/$pkgver/$_pkgname-$pkgver-linux.zip"
        "LICENSE.md")
sha256sums=('adb3fa37c49bb137b772379a4c5e07c3ac9609871cd3058c376e32f9fb9ee434'
            '8a1af140fdfbf5afd3df27f7e662f989c5b963a300020dfafce42033cae9e004')

package() {
  install -Dm 755 as-tree -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
