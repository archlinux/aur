# Maintainer: Radek Podgorny <radek@podgorny.cz>
pkgname=re-natal
pkgver=0.8.2
pkgrel=1
pkgdesc=" Bootstrap ClojureScript React Native apps"
arch=(any)
url="https://github.com/drapanjanas/re-natal"
license=('')
depends=('nodejs')
makedepends=('npm')

package() {
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
