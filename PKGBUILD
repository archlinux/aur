# Maintainer: E5ten

pkgname=opendm
_pkgname=OpenDM
pkgver=0.0.4
pkgrel=2
pkgdesc="A simple GUI Display Manager written entirely in bash that uses xinit to start X sessions"
arch=('x86_64')
url='http://www.simonizor.net'
license=('MIT')
depends=('qarma' 'xorg-xinit' 'wmctrl')
install=opendm.install
source=("https://github.com/simoniz0r/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('c687d82933cd9be423195dce4ed00eb4')

package() {
	cd $srcdir/$_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
