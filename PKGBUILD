# -*- shell-script -*-
# Contributor: Alastair Pharo  asppsa at gmail dot com
# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=nix-multiuser
pkgver=1.7
pkgrel=1
pkgdesc="Set up multi-user environment for the Nix package manager"
arch=("any")
license=('MIT')
url="http://nixos.org/nix/manual/#ssec-multi-user"
depends=('nix>=1.7')
install=nix-multiuser.install
source=()
md5sums=()

package() {
  mkdir -p $pkgdir/etc/profile.d
  echo "export NIX_REMOTE=daemon" > $pkgdir/etc/profile.d/nix-multiuser.sh
}
