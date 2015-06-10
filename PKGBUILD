# Maintainer : Axilleas Pipinellis <axilleas@archlinux.info>

_pkgname=pysendfile
pkgname=python2-sendfile
pkgver=2.0.1
pkgrel=1
pkgdesc="A Python interface to sendfile(2)"
url="https://github.com/giampaolo/pysendfile"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('python2')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")

package() {
	cd $srcdir/$_pkgname-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
	}

# vim:set ts=2 sw=2 et
md5sums=('e7b301eddd703ab74a48c59a8fda1f97')
