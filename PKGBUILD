# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=10.0.0
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('any')
license=('Apache-2.0')
provides=('capa')
conflicts=('capa' 'capa-git')
source=("$_pkg-$pkgver-$pkgrel.zip::$url/releases/download/v$pkgver/$_pkg-v$pkgver-linux-py313.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('94a068870dc5e83c2b404d315714143bbfbc73bedb18be46532b205918b1dc0c1ea1f5815b7d37232fe25e1c05aebab2b5277723b25d48193b4a812de0ea9c56'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8')

package() {
  install -Dm755 $_pkg "$pkgdir/usr/bin/$_pkg"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
}
