# Maintainer: Scott Dickson <scottfoesho@gmail.com>

pkgname=cops
pkgver=1.1.1
pkgrel=1
pkgdesc='Calibre OPDS (and HTML) PHP Server : web-based light alternative to Calibre content server / Calibre2OPDS to serve ebooks'
arch=('any')
url='https://github.com/seblucas/cops'
license=('GPL2')
depends=('php' 'php-gd' 'php-intl' 'php-sqlite')
optdepends=('apache: Web server to run COPS'
            'nginx: Web server to run COPS'
	    'cherokee: Web server to run COPS')
install="$pkgname.install"
source=("https://github.com/seblucas/cops/releases/download/1.1.1/cops-1.1.1.zip")
sha256sums=('242262d0b468b6ce42564d3c125b1ff2ca76d86fd44db78a598ebd2cd3317cb1')

package() {
  cd "${srcdir}/cops-$pkgver"
  install -d "$pkgdir/usr/share/webapps/cops"
  cp -r . "$pkgdir/usr/share/webapps/cops/"
}

