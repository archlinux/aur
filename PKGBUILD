# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-cloud_sptheme
pkgname=('python-cloud_sptheme' 'python2-cloud_sptheme')
pkgname=python-cloud_sptheme
pkgver=1.7.1
pkgrel=1
pkgdesc="a nice sphinx theme named 'Cloud', and some related extensions"
arch=(any)
url="https://bitbucket.org/ecollins/cloud_sptheme"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/27/5d/7ba4127f83acd3aad08a3a28e44c54a3fbecf3c527ef5012e0874b8cb045/cloud_sptheme-${pkgver}.tar.gz")
sha256sums=('7ea3b2da3dd4c12c8a1f859327d1bb5decae9aaa358a1a1cb2f4b772c955a97e')

package_python2-cloud_sptheme() {
  depends=('python2-sphinx')
  pkgdesc="a nice sphinx theme named 'Cloud', and some related extensions (python2 version)"
  
  cd "${srcdir}/cloud_sptheme-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-cloud_sptheme"
  install -v -m644 README "${pkgdir}/usr/share/doc/python2-cloud_sptheme/"
}

package_python-cloud_sptheme() {
  depends=('python-sphinx')
  pkgdesc="a nice sphinx theme named 'Cloud', and some related extensions (python3 version)"

  cd "${srcdir}/cloud_sptheme-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-cloud_sptheme"
  install -v -m644 README "${pkgdir}/usr/share/doc/python-cloud_sptheme/"
}

# vim:set ts=2 sw=2 et:

