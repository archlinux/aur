# Maintainer: archelinux maintainers (https://github.com/archelinux/arch-tools/issues)
# SPDX-License-Identifier: 0BSD
pkgname=arche-waybar-github
pkgver=2.0.1
pkgrel=1
pkgdesc='Unread GitHub pull requests and issues for Waybar'
arch=('any')
url='https://archelinux.github.io/archelinux.org/wiki/arch-tools.html'
license=('GPL-3.0-only')
depends=('python' 'github-cli')
optdepends=('waybar: display the module' 'xdg-utils: open notifications from Waybar')
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/archelinux/arch-tools/v$pkgver/bin/$pkgname")
sha256sums=('7fcfb01655bfbb3af23cd8111a46945067ba083a9bf48ad7dce149750e2d93e8')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
