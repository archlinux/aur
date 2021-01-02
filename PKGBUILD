# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=nodejs-csso
pkgver=3.0.0
pkgrel=1
pkgdesc="CSS minifier with structural optimisations"
arch=('any')
url="https://github.com/css/csso-cli"
license=('MIT')
depends=('nodejs' 'nodejs-csso')
makedepends=('npm' 'nodejs-csso')
source=("https://registry.npmjs.org/csso-cli/-/csso-cli-$pkgver.tgz")
sha256sums=('dc4a516ef7184a5b3c26daef0f90b2c0ea9e280119fcc97b4ce925e34ff21adc')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/csso-cli-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
