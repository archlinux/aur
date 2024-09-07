# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=updpkgsrcs
pkgver=0.1.2
pkgrel=1
pkgdesc='Update source array of Git submodules in PKGBUILD'
arch=(any)
url="https://aur.archlinux.org/packages/$pkgname"
license=(
  'GPL-3.0-or-later')
depends=(
  'coreutils'
  'bash'
  'sed'
  'git')
source=(
  'updpkgsrcs.sh')

package() {
  install -Dm755 "${source[0]}" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('1dad7eecb2bcb0b4e61b5d49fb886976b33a328ddffed6def82c194bf4f408e4')
