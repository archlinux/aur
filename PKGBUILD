# Maintainer: wordofglass <wordofglass@users.noreply.github.com>

pkgname=beets-alternatives
pkgver=0.8.2
pkgrel=1
pkgdesc="Beets plugin to manage external files"
arch=('any')
url="https://github.com/geigerzaehler/${pkgname}"
license=('custom')
depends=('python2' 'beets>=1.3.13')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('ba849213a5b3b5626d8048634d831f12')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
