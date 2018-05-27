# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=nodejs-shelljs
pkgver=0.8.2
pkgrel=1
pkgdesc="ShellJS - Unix shell commands for Node.js"
arch=('any')
url="https://www.npmjs.com/package/shelljs"
license=('BSD')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/shelljs/-/shelljs-$pkgver.tgz")

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/shelljs-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
}

sha256sums=('8ef117fa17983c249db43811880679382d2c8d5fb7e22d08324df469cecd28fd')
