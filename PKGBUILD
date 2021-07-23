# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=python-biplist
pkgver=1.0.3
pkgrel=1
pkgdesc="Library for reading/writing binary property lists"
arch=(any)
url="https://bitbucket.org/wooster/biplist"
license=('BSD')
depends=('python')
makedepends=('python-pip' 'python-setuptools')
source=("https://bitbucket.org/wooster/biplist/downloads/biplist-${pkgver}.tar.gz")
sha512sums=('186927481229988c713d9bb703115493001b129ed4e540e9a028e99b4f10e1576291c75f98d39b28e04092c14a9c96e4843c1445d9a318ced322323c7c1134b5')

package() {
    cd "biplist-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
