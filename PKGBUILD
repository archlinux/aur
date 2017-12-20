# Maintainer: Scott Dickson <scottfoesho@gmail.com>

pkgname=cops
pkgver=1.1.1
pkgrel=1
pkgdesc='Calibre OPDS (and HTML) PHP Server : web-based light alternative to Calibre content server / Calibre2OPDS to serve ebooks'
arch=('any')
url='https://github.com/seblucas/cops'
license=('GPL2')
depends=('php')
optdepends=('apache: Web server to run COPS'
            'nginx: Web server to run COPS'
	    'cherokee: Web server to run COPS')
install="$pkgname.install"
source=("https://github.com/seblucas/cops/archive/1.1.1.tar.gz")
sha256sums=('c0a08133918afd51d7c558222dd579a5e84d9cf87ab21b7610a4b7e980be807c')

package() {
  cd "${srcdir}/cops-$pkgver"
  install -d "$pkgdir/usr/share/webapps/cops"
  cp -r . "$pkgdir/usr/share/webapps/cops/"
}

