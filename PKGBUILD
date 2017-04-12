# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=ezame
pkgver=0.6.2
pkgrel=1
pkgdesc="A desktop and menu file editor"
arch=('i686' 'x86_64')
url="https://github.com/linux-man/ezame"
license=('GPL3')
depends=('python' 'python-gobject' 'desktop-file-utils')
source=("https://github.com/linux-man/ezame/archive/v$pkgver.tar.gz")
md5sums=('5aaa54cbc7bcb279b9bbbf349e2ffdd2')


package() {
	cd $srcdir/$pkgname-$pkgver
	python setup.py install --root $pkgdir
} 
