# Maintainer Stefano Lovato <stefano.lovato.1@phd.unipd.it>
pkgname=resticpy
pkgver=1.2.1
pkgrel=1
pkgdesc="A Python wrapper for Restic (<https://restic.net/>) using a json configuration file."
arch=('any')
url="https://github.com/stefphd/ResticPy"
license=('GPLv3')
depends=('python' 'python-argparse')
makedepends=('git')
source=("git+https://github.com/stefphd/ResticPy.git")
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/ResticPy/resticpy" "$pkgdir/usr/bin/resticpy"
	chmod +x "$pkgdir/usr/bin/resticpy"
}
