# Maintainer: Happilli <https://github.com/happilli>
pkgname=ryu-bin
_pkgname=ryu
pkgver=0.0.22
pkgrel=1
pkgdesc="Collection of Qt6 QML plugins for ryu.. (prebuilt)"
arch=('x86_64')
license=('BSD-2-Clause')
url="https://github.com/Happilli/ryu"
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard' 'pipewire')
provides=("$_pkgname=$pkgver")
options=('!strip' '!debug')
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/Happilli/ryu/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/Happilli/ryu/v$pkgver/LICENSE")
sha256sums=('e87f62f7a0c1d66aed15bf8a16c16f023a538aca51b90bbed4c374763c2a086c'
            '47eb383c5eadf7ad1499b981bd842679d7a73275801c83a24035b7e09e7c5b83')

package() {
  cp -a usr "$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
