# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=nodejs-csso
pkgver=4.2.0
pkgrel=1
pkgdesc="CSS minifier with structural optimisations"
arch=('any')
url="https://github.com/css/csso"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/csso/-/csso-$pkgver.tgz")
sha256sums=('4b9b8c96cb4082224fec97d9050c48b1877bd03fab6332b2cb4b649b0f71f948')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/csso-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
