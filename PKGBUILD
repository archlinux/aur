# Maintainer: Nicolas Quiénot <niQo @ aur>
pkgname=python-pretty-cron
_pkgname=pretty-cron
pkgver=1.0.2
pkgrel=1
pkgdesc="Converts crontab expressions to human-readable descriptions."
arch=('i686' 'x86_64')
url="https://github.com/adamchainz/pretty-cron"
license=('GPL')
depends=('python')
makedepends=()
source=("https://github.com/adamchainz/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7c57e798a46844999fc3fbe1b6ef7c0e')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  python setup.py install --root=$pkgdir
}
