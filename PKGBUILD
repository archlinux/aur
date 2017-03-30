# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

_npmname=generator-aspnet

pkgname=nodejs-generator-aspnet
pkgver=0.3.3
pkgrel=1
pkgdesc="Yeoman generator for ASP.NET Core 1.0 apps"
arch=('any')
url="https://github.com/omnisharp/generator-aspnet"
license=('APACHE')
depends=('nodejs-yeoman')
options=('!emptydirs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('c1406b6b170e4d9eebf469986e9e13bc0c064218c914e0a105daa6d059a42b8c')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}
