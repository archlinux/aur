pkgname=fcitx5-areca-bin
_pkgname=fcitx5-areca
pkgver=8.3.0
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
sha256sums=('d8c278c47de332ddd87685f768d2c51ad526f880dc56ed61c5abd02c6b57898e')
options=(!debug !strip)

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
