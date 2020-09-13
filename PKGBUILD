# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-linetools
pkgver=0.3
pkgrel=1
pkgdesc="Package for the analysis of 1-D spectra for astronomy."
arch=('x86_64')
url="https://linetools.readthedocs.io/"
license=('BSD')
depends=('python'
         'python-numpy'
         'python-astropy'
         'python-scipy'
         'python-matplotlib'
         'python-pyqt5'
         'python-h5py')
source=("https://files.pythonhosted.org/packages/ca/17/8ea3b0a7a05cca067d061b097f0df9b74bddeab702391aba0bb566b97cc2/linetools-0.3.dev2147.tar.gz")
md5sums=('86f631e7e52b2dc80e5e96b2d22621f3')

package(){
    cd $srcdir/linetools-$pkgver

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
