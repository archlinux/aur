
#
# Maintainer: Alexandru Iercosan-Lucaci <lucaci32u4@gmail.com>
#
# shellcheck disable=SC2154
# shellcheck disable=SC2034


pkgname=gitswitch
pkgver=1.0
pkgrel=1

pkgdesc='Simple rofi script to switch git users'

arch=('x86_64')
url=https://gitlab.com/clockworks2/gitswitch.git
license=('None')

makedepends=()
depends=('python3' 'rofi' 'git' 'libnotify')

source=('git+https://gitlab.com/clockworks2/gitswitch')

package() {
  local rt="$pkgdir"
  mkdir -p "$rt"/usr/bin
  mkdir -p "$rt"/usr/share/applications/
  mkdir -p "$rt"/usr/share/gitswitch/
  mv gitswitch/gitswitch "$rt"/usr/bin/
  mv gitswitch/gitswitch.desktop "$rt"/usr/share/applications/
  mv gitswitch/theme.rasi "$rt"/usr/share/gitswitch/
  mv gitswitch/users.json "$rt"/usr/share/gitswitch/
}

md5sums=('SKIP')
