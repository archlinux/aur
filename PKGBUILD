# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=ezame
pkgver=0.6.4
pkgrel=1
pkgdesc="A desktop and menu file editor"
arch=('i686' 'x86_64')
url="https://github.com/linux-man/ezame"
license=('GPL3')
depends=('python' 'python-gobject' 'desktop-file-utils')
conflicts=('ezame-git')
source=("https://github.com/linux-man/ezame/archive/v$pkgver.tar.gz")
md5sums=('39a4048571c1b39957a8a2961c8baf3f')


package() {
	cd $srcdir/$pkgname-$pkgver
	python setup.py install --root $pkgdir
} 
