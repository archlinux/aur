pkgname=fcitx5-areca-bin
_pkgname=fcitx5-areca
pkgver=8.3.3
pkgrel=1
pkgdesc='Areca Vietnamese input method for Fcitx5 using the Bamboo engine'
arch=('x86_64')
url='https://github.com/xhkzeroone/ArecaIME'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=(
  'fcitx5'
  'gtk4'
  'python'
  'python-gobject'
  'gdk-pixbuf2'
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
sha256sums=('52e2c272b1ac894ea860f6d5981f709e1aba93cb269ea9ab6a500db63db1280e')
options=(!debug !strip)

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
