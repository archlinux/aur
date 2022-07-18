# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-youtube'
pkgname=('python-sphinxcontrib-youtube')
pkgver='1.2.0'
pkgrel='1'
pkgdesc="Sphinx extension to defines the directives, “youtube” and “vimeo”, for embedding YouTube and Vimeo videos, respectively"
arch=('any')
url="https://github.com/sphinx-contrib/youtube"
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/sphinx-contrib/youtube/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('50b022ebc3ee6929926824ebb113070f')

package_python-sphinxcontrib-youtube(){
  depends=('python' 
           'python-sphinx')
  cd youtube-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
