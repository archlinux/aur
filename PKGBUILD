# maintainer: <atthis at eris dot club>

pkgname=vilearn
pkgver=1.0
pkgrel=1
pkgdesc="An interactive vi tutorial."
arch=('any')
source=("http://eris.club/pit/"{vilearn-1.0.tar.gz,vilearn.diff})
md5sums=('8fd3b72e5eb1e4dce1870e7b3becbeab'
	 '39975f4064c59c30545f6f070fc85cc6')

package() {
  cd $srcdir
  patch -d vilearn-1.0 < vilearn.diff
  cd vilearn-1.0
  make DESTDIR=${pkgdir} install
}

# written in the vi editor
