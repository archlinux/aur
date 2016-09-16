# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

_npmname=generator-aspnet

pkgname=nodejs-generator-aspnet
pkgver=0.2.2
pkgrel=1
pkgdesc="Yeoman generator for ASP.NET Core 1.0 apps"
arch=('any')
url="https://github.com/omnisharp/generator-aspnet"
license=('APACHE')
depends=('nodejs-yeoman')
options=('!emptydirs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('16f8ccd271bc4baa2693e7f55dbad904879859d88ea3ff7548f6e710a1d9755d')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}
