# Maintainer: mdraw.gh@gmail.com

pkgname=seashells
pkgver=0.1.2
pkgrel=0
pkgdesc='Pipe output from CLI programs to seashells.io in real-time'
url='https://github.com/anishathalye/seashells'
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
conflicts=('seashells-git')
source=("https://github.com/anishathalye/seashells/archive/v${pkgver}.tar.gz")
sha256sums=('bb6e659ae2e5da76786a185246116137bf6062865591b07fb842911070135ccf')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

