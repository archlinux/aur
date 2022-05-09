# Maintainer: papojari <papojari-git.ovoid@aleeas.com>

pkgname='seehecht'
pkgver=3.0.1
pkgrel=1
pkgdesc='A tool to quickly open a markdown document with already filled out frontmatter'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/papojari/$pkgname"
license=('LGPL3')
makedepends=('just' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/papojari/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('25f7fb22d2eebcc31edadb133e4d7f297ce036067466d7b05e7287bd558fd38c')

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  just --set INSTALL_PATH="$pkgdir/usr" system-install
}
