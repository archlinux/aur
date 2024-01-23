# Maintainer: Chris Lane <aur at chrislane dot com>
_pkgname=instant-markdown-d
pkgname="nodejs-$_pkgname"
pkgver=0.3.0
pkgrel=1
pkgdesc='Small instant Markdown preview server'
arch=('any')
url='https://github.com/instant-markdown/instant-markdown-d'
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha512sums=('867f89c85a4e9b0045000dea375eda2bb84ca4d337ff7fddaa7f2194c667ca59202025e7d06fa2091b89a3c4e0616c33c9d8ac067c1bfdc010f28871a248eb39')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
