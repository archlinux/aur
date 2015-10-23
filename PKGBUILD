# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=mps
pkgver=0.20.16
pkgrel=1

pkgdesc="Terminal based jukebox with playlist management"
url='https://github.com/np1/mps'
arch=('any')
license=('GPL3')

depends=('python' 'python-setuptools' 'python-pafy' 'mplayer')
optdepends=('xclip: for copying content to the clipboard')

source=("$pkgname-$pkgver.tar.gz::https://github.com/np1/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('23542f7dc7ae418ff41ea86debedfe5051d47efec3d0bc170ad0d59b5ec668d0')

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
