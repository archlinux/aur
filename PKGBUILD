# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=9.3.0
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('any')
license=('Apache-2.0')
provides=('capa')
conflicts=('capa' 'capa-git')
source=("$_pkg-$pkgver-$pkgrel.zip::$url/releases/download/v$pkgver/$_pkg-v$pkgver-linux-py312.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('8de77603dc1255c779715724dd3244a39d2da172f978702a970d87679d1fc812364b740876efb73727c5a827c19196888ef06932678e88f3a93b3182cb186faf'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8')

package() {
  install -Dm755 $_pkg "$pkgdir/usr/bin/$_pkg"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
}
