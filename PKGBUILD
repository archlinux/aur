# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-jquery.tablesorter"
pkgver=2.14.5.1
pkgrel=1
pkgdesc="XStatic-JQuery.TableSorter"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic-JQuery.TableSorter"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://pypi.python.org/packages/source/X/XStatic-JQuery.TableSorter/XStatic-JQuery.TableSorter-${pkgver}.tar.gz")
md5sums=('fc05a6731b6ac3f6489b893f96a5d29a')

package() {
  pip2 install --root ${pkgdir} XStatic-JQuery.TableSorter-${pkgver}.tar.gz
}
