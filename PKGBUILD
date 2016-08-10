# Maintainer: Felipe F. Tonello <eu@felipetonello.com>

pkgbase=python-codegen
_pkgbase=codegen
pkgname=('python-codegen' 'python2-codegen')
pkgver=1.0
pkgrel=4
pkgdesc="Extension to ast that allow ast -> python code generation."
arch=('any')
url="http://github.com/andreif/codegen"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=(https://github.com/andreif/${_pkgbase}/archive/${pkgver}.tar.gz)
md5sums=('3700a064df8c1d3915bfe2944ece9d33')

package_python-codegen() {
    cd ${srcdir}/${_pkgbase}-${pkgver}
    python3 setup.py install --root ${pkgdir} --prefix=/usr

    install -D -m 644 README.md ${pkgdir}/usr/share/licenses/${pkgname}/README.md
}

package_python2-codegen() {
    cd ${srcdir}/${_pkgbase}-${pkgver}
    python2 setup.py install --root ${pkgdir} --prefix=/usr

    install -D -m 644 README.md ${pkgdir}/usr/share/licenses/${pkgname}/README.md
}
