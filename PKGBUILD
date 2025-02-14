# Maintainer: Damien Guihal <dguihal@gmail.com>

pkgbase=python-awscli-plugin-endpoint
pkgname=('python-awscli-plugin-endpoint')
pkgname=python-awscli-plugin-endpoint
pkgver=0.4
pkgrel=3
pkgdesc="This awscli plugin provides service endpoint configure **per service** on profile."
arch=(any)
url="https://github.com/wbingli/awscli-plugin-endpoint"
license=('Apache-2.0')
makedepends=('python-setuptools')
depends=('aws-cli>=1.11.0')
options=(!emptydirs)
source=("https://github.com/wbinglee/awscli-plugin-endpoint/tarball/${pkgver}")
sha256sums=('f87c3e9e9f08047517848908c729411be055f7dc24cd6d2cff5b9a44dfc9afb5')

package_python-awscli-plugin-endpoint() {
  pkgdesc="This awscli plugin provides service endpoint configure **per service** on profile. (python3 version)"

  cd "${srcdir}/wbingli-awscli-plugin-endpoint-ab3aa53"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-awscli-plugin-endpoint"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/python-awscli-plugin-endpoint/"
}

# vim:set ts=2 sw=2 et:

