# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=purescript-language-server-bin
_pkgname=purescript-language-server
pkgver=0.14.4
pkgrel=1
pkgdesc="Node-based Language Server Protocol server for PureScript."
url="https://github.com/nwolverson/${_pkgname}"
license=("MIT")
arch=("any")
depends=("nodejs" "npm")
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")

sha256sums=("105da35be849088db1b27943e0caf4af1f8f2010485e61f4b33780dc26f09db1")

package() {
  npm i -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
}

