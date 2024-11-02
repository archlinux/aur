# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=ezame
pkgver=0.7.0
pkgrel=2
pkgdesc="A desktop and menu file editor"
arch=('i686' 'x86_64')
url="https://github.com/linux-man/ezame"
license=('GPL3')
depends=('python' 'python-gobject' 'desktop-file-utils')
makedepends=('python-setuptools')
source=("https://github.com/linux-man/ezame/archive/v$pkgver.tar.gz")
md5sums=('449739307314763bd349c8ab50be3fcf')


package() {
	cd $srcdir/$pkgname-$pkgver
	python setup.py install --root $pkgdir
} 
