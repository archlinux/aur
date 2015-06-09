# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ppa: name=${pkgname}, url=ppa:bhdouglass/indicator-remindor, native

pkgname=remindor-common
pkgver=14.06
_ppa_rel=0ubuntu1~trusty
pkgrel=1
pkgdesc="Common files for indicator-remindor and remindor-qt"
arch=(any)
url="http://bhdouglass.tk/remindor/indicator/"
license=(GPL)
groups=(unity-extra)
depends=(python2-dateutil python2-dbus python2-feedparser python2-requests)
makedepends=(python2-distutils-extra)
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/r/remindor-common/remindor-common_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=('f42e30bd30198cbd7c4b08187c1fe81e43811602aba599f16105568acc4de7712f38c97f8c451a69f5283c27db828d7c60c9c0e8ea436ee9a0fbe68d1eb8fa0a')

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
