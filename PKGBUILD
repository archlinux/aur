# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=nyaovim
pkgver=0.0.18
pkgrel=1
pkgdesc="Neovim frontend built on Electron"
arch=(any)
url="https://www.npmjs.com/package/nyaovim"
license=("MIT")
depends=('nodejs' 'libnotify')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('8461bd78555b91114bea3cd553e2d38ee7baa56e7fef4566017f99b95c3558c6')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"
}
