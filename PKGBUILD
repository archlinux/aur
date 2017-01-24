 _pkgname=SIDEKIT
 pkgname=python-sidekit
 pkgver=1.1.7
 pkgrel=1
 pkgdesc="An open source package for Speaker and Language recognition"
 url="http://lium.univ-lemans.fr/sidekit/"
 depends=('python' 'python-matplotlib' 'python-mock' 'python-pyparsing' 'python-dateutil'
 'python-nose' 'python-numpy' 'python-six' 'python-scipy' 'python-h5py' 'python-pandas' 'python-theano')
 makedepends=('python-pip')
 license=('LGPL')
 arch=('any')
 source=("http://lium.univ-lemans.fr/sidekit/_downloads/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e6269ec9c96d58e38d6f2e2c462d221b0c1cbcdf508898c92d7f8a1766bb1fc9a8ed90b18debadd8d7a9f5762d0916613a49fa6d0e7e4e58516290e8a419e781')

 build() {
	 cd "$srcdir/${_pkgname}-$pkgver"
	 python setup.py build
 }

 package() {
	 cd "$srcdir/${_pkgname}-$pkgver"
	 python setup.py install --root="$pkgdir" --optimize=1 
 }


