# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=td
pkgver=0.4
pkgrel=1
pkgdesc="A non-offensive, per project ToDo manager."
arch=(any)
url="https://github.com/KenjiTakahashi/td"
license=('GPL3')
depends=('python')
makedepends=('python-distribute')
provides=('td')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f9f2722f38c03ff608bb1263a500f406')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python3 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
