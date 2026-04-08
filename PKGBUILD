# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
pkgname=n2-ninja-symlink
pkgver=1
pkgrel=2
pkgdesc="Symlinks ninja to n2"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('n2-git')
provides=('ninja')
conflicts=('ninja')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/" || exit 1
  ln -s n2 ninja
}

# vim:set ts=2 sw=2 et:
