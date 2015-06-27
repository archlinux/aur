# Maintainer: aksr <aksr at t-com dot me>
pkgname=markv
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Takes ASCII text and returns nonsense."
arch=('i686' 'x86_64')
url="http://homepages.ihug.co.nz/~trmusson/programs.html#markov"
license=('GPLv2')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://homepages.ihug.co.nz/~trmusson/stuff/$pkgname-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('5caf578b30b4edb9841709346dfbb6ea')
sha1sums=('52ec97857894e72b8e8fd6a80496f29088fd173d')
sha256sums=('4205195104b3d71447dd4dac3d8e20fce4b299750c54591f93e1c4abcfa5bcff')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

