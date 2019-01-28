# Maintainer: Martin Fracker, Jr. <martin.frackerjr@gmail.com>

pkgname=nodejs-create-nuxt-app
_pkgname=create-nuxt-app
pkgver=2.2.3
pkgrel=1
pkgdesc="Create a Nuxt.js project in seconds"
arch=("any")
url="https://github.com/nuxt-community/create-nuxt-app"
license=("MIT")
depends=()
provides=("$_pkgname")
makedepends=("npm")
source=("https://registry.npmjs.org/create-nuxt-app/-/$_pkgname-$pkgver.tgz"
        "LICENSE::https://raw.githubusercontent.com/nuxt-community/create-nuxt-app/master/LICENSE"
        )
sha256sums=('037c0d4014365b00f6170abf5aacccc5f25bc57748fe36eb3eeea8c56b809992'
            '62203251d328f41a3c67da864559761824bff3940fa3a46af3530e81d112fc8d')

package() {
  npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr $_pkgname-$pkgver.tgz

  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
# vim:set ts=2 sw=2 et:
