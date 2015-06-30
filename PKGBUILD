# PKGBUILD created by: Gris Ge <cnfourt@gmail.com>
# PKGBUILD maintained by: Wang Chao <wangchao19890207@gmail.com>

pkgname=python-kobo
pkgver=0.3.6
pkgrel=1
pkgdesc="Kobo is set of python modules designed for rapid tools development."
arch=('any')
url="https://fedorahosted.org/kobo/"
license=('GPL')
depends=('python>=2.7')
source=("https://fedorahosted.org/releases/k/o/kobo/kobo-${pkgver}.tar.bz2")
md5sums=('21ede572d4e81b3072f0fd37aee7875c')

build() {
	cd $srcdir/kobo-$pkgver
	python2 setup.py install --prefix=/usr --root="$pkgdir" || return $?
}
