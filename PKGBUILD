# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=updpkgsrcs
pkgver=0.0.1
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

sha256sums=('1f182fdd25c3625d2147de91c9697f144335bc69d674086d5f6d343c53f82f09')
