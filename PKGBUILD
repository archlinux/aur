# Maintainer: archelinux maintainers (https://github.com/archelinux/arch-tools/issues)
# SPDX-License-Identifier: 0BSD
pkgname=arche-rollback
pkgver=2.0.1
pkgrel=1
pkgdesc='Restore a previous package version from configured pacman caches'
arch=('any')
url='https://archelinux.github.io/archelinux.org/wiki/arch-tools.html'
license=('GPL-3.0-only')
depends=('pacman' 'bash')
optdepends=('sudo: escalate when invoked by a regular user')
conflicts=('arche-maintenance')
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/archelinux/arch-tools/v$pkgver/bin/$pkgname")
sha256sums=('46792513257792bd593795a20213976dc4f89011956a8c5d0e4ace60e0d2e5e8')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
