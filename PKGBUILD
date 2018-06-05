# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=ezame
pkgver=0.6.3
pkgrel=1
pkgdesc="A desktop and menu file editor"
arch=('i686' 'x86_64')
url="https://github.com/linux-man/ezame"
license=('GPL3')
depends=('python' 'python-gobject' 'desktop-file-utils')
conflicts=('ezame-git')
source=("https://github.com/linux-man/ezame/archive/v$pkgver.tar.gz")
md5sums=('deef23bacb0403c4ec800b117db63a2c')


package() {
	cd $srcdir/$pkgname-$pkgver
	python setup.py install --root $pkgdir
} 
