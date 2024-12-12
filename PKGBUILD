# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=8.0.1
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('any')
license=('Apache-2.0')
provides=('capa')
conflicts=('capa' 'capa-git')
source=("$_pkg-$pkgver-$pkgrel.zip::$url/releases/download/v$pkgver/$_pkg-v$pkgver-linux-py312.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('884cb0ef3303da8d261ad3fc29dc807519665a9d80eccfd31bb6ee45603a73b780f33bf9669a88c493c5c8a1ee62679b9e8b8b763e5847e23c500ff0b73f184f'
            'cfc7776e12281307fdbc69bad4fbe2572342466f4928e3e8f9c56020df4749003812586119b5a70bd008d74776c8bf157ae046c443d884793b8dec076e8f377a')

package() {
  install -Dm755 $_pkg "$pkgdir/usr/bin/$_pkg"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
}
