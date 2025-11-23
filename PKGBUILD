# Maintainer: unjaks

pkgname=hyconf
pkgver=1.0.1
pkgrel=2
pkgdesc="A simple shell script that uses fzf for configuring the Hyprland window manager config files (.yaml / .conf / .toml)"
arch=('any')
url="https://github.com/unjaks/${pkgname}"
license=('GPL3')
depends=('fzf' 'hyprland')
provides=('hyconf')
source=("hyconf")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/hyconf" "$pkgdir/usr/local/bin/hyconf"
}
