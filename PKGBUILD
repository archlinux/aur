# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-agnpy
pkgver=0.0.7
pkgrel=1
pkgdesc="Modelling Active Galactic Nuclei radiative processes with python."
arch=('x86_64')
url="https://agnpy.readthedocs.io/"
license=('GPL')
depends=('python'
         'python-numpy'
         'python-astropy'
         'python-matplotlib')
source=("https://github.com/cosimoNigro/agnpy/archive/v${pkgver}.tar.gz")
md5sums=('6b6561a49e69e47ac1b942d666642cca')

package(){
    cd $srcdir/agnpy-$pkgver

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
