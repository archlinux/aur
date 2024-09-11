# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=updpkgsrcs
pkgver=0.1.3
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

sha256sums=('cb282a6b2ffe63296e9d3af3ab35b9618ce87ac82fe3b22aac3180ec5725bd28')
