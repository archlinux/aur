# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=updpkgsrcs
pkgver=0.1.6
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
  cd "$srcdir"
  install -Dm755 "${source[0]}" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('9d1506b0adfb776aaef66b4ad4b86d986541091a729e43194103c370baf37890')
