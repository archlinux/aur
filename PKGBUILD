pkgname=mod_ucam_webauth
pkgver=2.0.5
pkgrel=1
pkgdesc="Ucam WebAuth Apache authentication agent"
arch=(any)
url="https://github.com/cambridgeuniversity/mod_ucam_webauth"
license=('Apache')
depends=('apache')
source=("${url}/archive/v${pkgver}.tar.gz")

package() {
	mkdir -p $pkgdir/usr/lib/httpd/modules
	cd $srcdir/${pkgname}-${pkgver}
    OPT=-SLIBEXECDIR=$pkgdir/usr/lib/httpd/modules make
    OPT=-SLIBEXECDIR=$pkgdir/usr/lib/httpd/modules make install
}

sha256sums=('3e8ca3d6c76d69cb9d125d73251c482f0e09c9e91020ef2d76a13ea18bfc6252')
