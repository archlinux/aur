# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase='python-sphinxcontrib-confluencebuilder'
pkgname=('python-sphinxcontrib-confluencebuilder'
         'python2-sphinxcontrib-confluencebuilder')
pkgver='1.9.0'
pkgrel='1'
pkgdesc="Sphinx extension to build Confluence® compatible markup format files and optionally publish them"
arch=('any')
url="https://github.com/sphinx-contrib/confluencebuilder"
makedepends=('python-setuptools'
             'python2-setuptools')
license=('GPL')
source=("https://github.com/sphinx-contrib/confluencebuilder/archive/refs/tags/v1.9.tar.gz")
md5sums=('c87fc0aeff382d05465038695cbd2ffa')

package_python-sphinxcontrib-confluencebuilder(){
  depends=('python' 
           'python-sphinx')
  cd confluencebuilder-1.9
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-confluencebuilder(){
  depends=('python2' 
           'python2-sphinx')
  cd confluencebuilder-1.9
  PYTHONPATH=/usr/lib/python2.7/site-packages
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
