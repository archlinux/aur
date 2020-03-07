# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>

pkgname='whatstyle-git'
pkgver='0.1.8'
pkgrel=1
pkgdesc='whatstyle finds a code format style that fits given source files.'
url='https://github.com/mikr/whatstyle'
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/mikr/whatstyle.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/whatstyle"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

