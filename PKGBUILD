pkgname=fcitx5-areca-bin
_pkgname=fcitx5-areca
pkgver=8.1.9
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
sha256sums=('a6de576c8c6f88aac9f94045f196988c0be1c45861ae14989cbc093d4fae3102')
options=(!debug !strip)

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
