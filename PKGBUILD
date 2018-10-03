# Maintainer: Damien Guihal <dguihal@gmail.com>

pkgbase=python-awscli-plugin-endpoint
pkgname=('python-awscli-plugin-endpoint' 'python2-awscli-plugin-endpoint')
pkgname=python-awscli-plugin-endpoint
pkgver=0.3
pkgrel=1
pkgdesc="This awscli plugin provides service endpoint configure **per service** on profile."
arch=(any)
url="https://github.com/wbingli/awscli-plugin-endpoint"
license=('Apache License 2.0')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('aws-cli>=1.11.0')
options=(!emptydirs)
source=("https://github.com/wbinglee/awscli-plugin-endpoint/tarball/0.3")
sha256sums=('0e9a2c9509b0a2bfafefcb543fa684974433de18099995d7f26284d2b1b0c61f')

package_python2-awscli-plugin-endpoint() {
  pkgdesc="This awscli plugin provides service endpoint configure **per service** on profile. (python2 version)"
  
  cd "${srcdir}/wbingli-awscli-plugin-endpoint-5bd5eaa"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-awscli-plugin-endpoint"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/python2-awscli-plugin-endpoint/"
}

package_python-awscli-plugin-endpoint() {
  pkgdesc="This awscli plugin provides service endpoint configure **per service** on profile. (python3 version)"

  cd "${srcdir}/wbingli-awscli-plugin-endpoint-5bd5eaa"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-awscli-plugin-endpoint"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/python-awscli-plugin-endpoint/"
}

# vim:set ts=2 sw=2 et:

