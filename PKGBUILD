# Maintainer: Wenger Binning <wengerbinning@163.com>

# package name
pkgname=wengerbinning
# package version
pkgver=0.1.0.1
# package release
pkgrel=1
# package description
pkgdesc="This is a lab package for Wenger Binning."
arch=('any')
url="https://github.com/wengerbinning"
license=("GPL")
source=("$url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

# package integrity
sha256sums=("a03c886573d3aff1ab918c9a9964da021db3f5885e164fe854a6e1ef324e2a1d")

prepare() {
	cd "$pkgname-$pkgver"
	echo "Running in prepare"
	# patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
    }

build() {
    cd "$pkgname-$pkgver"
    echo "Running in build"
    # ./configure --prefix=/usr
    # make
}

check() {
	cd "$pkgname-$pkgver"
	echo "Running in check"
	# make -k check
}

package() {
	cd "$pkgname-$pkgver"
	echo "Runnning in package"
	# make DESTDIR="$pkgdir/" install
}

