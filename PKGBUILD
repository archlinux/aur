# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
pkgname=netbird-multiconfig

pkgver=1.0.0
pkgrel=1
pkgdesc="A small script to help with multiple netbird configs using the systemd template"

arch=('any')
license=('GPL-3.0-or-later')
depends=('netbird')

source=(
  "netbird-multiconfig.sh"
)

package() {
  cd "$srcdir/"

  install -Dm755 "netbird-multiconfig.sh" "${pkgdir}/etc/netbird-multiconfig.bash"

  printf "\n\n======================================================\n"
  printf "| Please add the following to your /etc/bash.bashrc: |\n"
  printf "|        \"source /etc/netbird-multiconfig.bash\"      |\n"
  printf "======================================================\n\n"
}

sha256sums=('c9a0ed3d36fe62c4405e3a8d6773d7525ed3215e3eef0413bf6c2d65c527ee6a')
