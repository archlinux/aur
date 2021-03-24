# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=purescript-language-server-bin
_pkgname=purescript-language-server
pkgver=0.15.0
pkgrel=1
pkgdesc="Node-based Language Server Protocol server for PureScript."
url="https://github.com/nwolverson/${_pkgname}"
license=("MIT")
arch=("any")
depends=("nodejs" "npm")
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=("03f1cf97ebfc5dfe5c3de3887cac83d99e4b73379aaa49953b8b853b56eeb033")

package() {
  npm i -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
}

