pkgname=fcitx5-areca-bin
_pkgname=fcitx5-areca
pkgver=8.0.9
pkgrel=1
pkgdesc='Areca Vietnamese input method for Fcitx5 using the Bamboo engine'
arch=('x86_64')
url='https://github.com/xhkzeroone/ArecaIME'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=(
  'fcitx5'
  'libinput'
  'libei'
  'libportal'
  'systemd-libs'
  'sdl3'
  'fontconfig'
  'libx11'
  'libxtst'
)
optdepends=('fcitx5-configtool: graphical configuration tool')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('ec5f42588e7a65b375ca107d50929f6393d90b2da0a942a26acc8816784ff3c9')
options=(!debug !strip)

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
