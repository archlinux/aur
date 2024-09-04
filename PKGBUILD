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

sha256sums=('2b76b09058337df1d7ba3fd0f918599fe9d9bacbae6343d66168b91681e83786')
