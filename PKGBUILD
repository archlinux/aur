# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=9.2.0
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('any')
license=('Apache-2.0')
provides=('capa')
conflicts=('capa' 'capa-git')
source=("$_pkg-$pkgver-$pkgrel.zip::$url/releases/download/v$pkgver/$_pkg-v$pkgver-linux-py312.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('e684df17c28fea5786d3b6e0e905e0fba5be6065b16cdb976ae7a2d698392c171cde7fbdd3c93a0a6726fd4608497de4a361afcab229abc51793aba78364437e'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8')

package() {
  install -Dm755 $_pkg "$pkgdir/usr/bin/$_pkg"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
}
