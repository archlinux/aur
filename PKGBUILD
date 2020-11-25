# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=fcitx-skin-aqua
pkgver=0.1
_commit=fdc8379b94ea79e9215673eb84e41fa40cae1ca9
pkgrel=3
pkgdesc="Aqua - Fcitx skin"
arch=('any')
url="https://github.com/redchenjs/fcitx-skin-aqua"
license=('Apache')
source=("https://github.com/redchenjs/fcitx-skin-aqua/archive/$_commit/fcitx-skin-aqua-$_commit.tar.gz")
sha512sums=('7ba3dec58dba2a1fd52ec2661cd54cc4e85b2ffbe601b9ee1c67c0402a00daf48d707dd0b53880d82e8c65c65973b88ebdfe23de77714d633adfa9bb4f55f427')

package() {
  cd "$pkgname-$_commit"

  install -dm755 "$pkgdir/usr/share/fcitx/skin/aqua"
  install -Dm644 aqua/* "$pkgdir/usr/share/fcitx/skin/aqua/"
}
