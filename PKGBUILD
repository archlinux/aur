# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-youtube'
pkgname=('python-sphinxcontrib-youtube')
pkgver='1.1.0'
pkgrel='2'
pkgdesc="Sphinx extension to defines the directives, “youtube” and “vimeo”, for embedding YouTube and Vimeo videos, respectively"
arch=('any')
url="https://github.com/sphinx-contrib/youtube"
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/sphinx-contrib/youtube/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('54c571fcf88773ac2422517ffb2f5e3d')

package_python-sphinxcontrib-youtube(){
  depends=('python' 
           'python-sphinx')
  cd youtube-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
