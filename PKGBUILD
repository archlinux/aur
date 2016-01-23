# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Ricardo 'richerVE' Hernández <richerve«at»archlinux.com.ve>

pkgname=pynetfilter_conntrack
pkgver=0.6
pkgrel=2
pkgdesc='pynetfilter_conntrack is a Python binding of libnetfilter_conntrack. The binding is the file pynetfilter_conntrack.py and you have also a clone of conntrack program: conntrack.py.'
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pynetfilter_conntrack'
license=('GPL')
depends=('libnetfilter_conntrack>=0.0.75' 'python2' 'python2-ipy')
source=(https://github.com/regit/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('ddf7cd85d4df009079cd65fd06647d365b188b69021e98efb30f988a2d5f96eb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
