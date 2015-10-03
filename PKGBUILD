# Maintainer: Serge Victor <arch@random.re>
#
# This PKGBUILD includes commented out future-proof version for python3, 
# which is currently not supported by the package, unfortunately

_pipname=wikitools
pkgbase=python-wikitools
#pkgname=('python2-wikitools' 'python-wikitools')
pkgname=('python2-wikitools')
pkgver=1.3
pkgrel=1
pkgdesc="Python package for interacting with a MediaWiki wiki"
arch=('any')
url="https://github.com/alexz-enwp/wikitools"
license=('GPL3')
#makedepends=('python2-setuptools' 'python-setuptools')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('50ffe54dd1903cbd52538012b41bf481')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-wikitools() {
depends=('python2')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

}

#package_python-wikitools() {
#depends=('python')
#
#    cd $_pipname-$pkgver 
#    python setup.py install --root="$pkgdir/" --optimize=1#
#
#}

