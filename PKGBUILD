pkgname=fcitx5-areca-bin
_pkgname=fcitx5-areca
pkgver=8.0.2
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
sha256sums=('6bfe32ae88f505620946d59ef3d484868e048dbb7841bbf76a72d024c04104d6')
options=(!debug !strip)

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
