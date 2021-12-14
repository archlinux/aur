# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
pkgname=python-pretty-cron
_pkgname=pretty-cron
pkgver=1.2.0
pkgrel=1
pkgdesc="Converts crontab expressions to human-readable descriptions."
arch=('i686' 'x86_64')
url="https://github.com/adamchainz/pretty-cron"
license=('MIT')
depends=('python')
makedepends=()
source=("https://github.com/adamchainz/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8bd4ad0e16859cd7cfd41f77bc17575b')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  python setup.py install --root=$pkgdir
}
