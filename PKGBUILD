# Maintainer: Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>

pkgname=bzr-builder
pkgver=0.7.3
pkgrel=1
pkgdesc="A bzr plugin to construct a bzr branch based on a recipe"
url="https://launchpad.net/bzr-builder"
arch=('any')
license=("GPL3")
depends=('bzr' 'python2' 'python2-debian' 'devscripts' 'dput')
provides=('bzr-builder')
conflicts=('bzr-builder-bzr')
source=('https://launchpad.net/bzr-builder/trunk/0.7.3/+download/bzr-builder-0.7.3.tar.gz')
md5sums=('3ba527090b2bc440a8288ff243f9cc53')

package() {
	# Installing files
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/bzrlib/plugins/builder"
	cp -rp . "$pkgdir/usr/lib/python2.7/site-packages/bzrlib/plugins/builder"
}
