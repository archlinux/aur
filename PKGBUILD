# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-youtube'
pkgname=('python-sphinxcontrib-youtube'
         'python2-sphinxcontrib-youtube')
pkgver='1.0.1'
pkgrel='1'
pkgdesc="Sphinx extension to defines the directives, “youtube” and “vimeo”, for embedding YouTube and Vimeo videos, respectively"
arch=('any')
url="https://github.com/sphinx-contrib/youtube"
makedepends=('python-setuptools'
             'python2-setuptools')
license=('GPL')
source=("https://github.com/sphinx-contrib/youtube/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('f645cc95adcf5a8708e98fb0856196a1')

package_python-sphinxcontrib-youtube(){
  depends=('python' 
           'python-sphinx')
  cd youtube-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-youtube(){
  depends=('python2' 
           'python2-sphinx')
  cd youtube-${pkgver}
  PYTHONPATH=/usr/lib/python2.7/site-packages
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
