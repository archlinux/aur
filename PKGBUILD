# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=project-generator-definitions
pkgver=0.1.4
pkgrel=1
pkgdesc="Definitions for project-generator"
url="https://github.com/project-generator/project_generator_definitions/"
depends=('python'
         'python-pip'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/project_generator_definitions/archive/bbf16964e11f3cbf130b63afa55d02d71d89c63c.tar.gz")
sha512sums=('6ad17eeaeb289aa5c461493bcd194f0fe67ddad1345b332b82b744430b3967626a860af386a49dcb434011b016f06cdbdf57f06cb853362bb48ca7489ac34c45')

build() {
    cd "$srcdir/project_generator_definitions-bbf16964e11f3cbf130b63afa55d02d71d89c63c"
    python setup.py build
}

package() {
    cd "$srcdir/project_generator_definitions-bbf16964e11f3cbf130b63afa55d02d71d89c63c"
    python setup.py install --root="$pkgdir" --optimize=1 
}

