# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Ricardo 'richerVE' Hernández <richerve«at»archlinux.com.ve>

pkgname=pynetfilter_conntrack
pkgver=0.7
pkgrel=1
pkgdesc='pynetfilter_conntrack is a Python binding of libnetfilter_conntrack. The binding is the file pynetfilter_conntrack.py and you have also a clone of conntrack program: conntrack.py.'
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pynetfilter_conntrack'
license=('GPL')
depends=('libnetfilter_conntrack>=0.0.75' 'python2' 'python2-ipy')
source=(https://github.com/regit/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('80d20edd1f70385d30ae4fe1b890e30e4c4cced805104a4a36aea1b05096cfd3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
