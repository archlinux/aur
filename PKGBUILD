# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ppa: name=${pkgname}, url=ppa:bhdouglass/indicator-remindor, native

pkgname=remindor-common
pkgver=15.06.1
_ppa_rel=0ubuntu1~vivid
pkgrel=1
pkgdesc="Common files for indicator-remindor and remindor-qt"
arch=(any)
url="http://bhdouglass.tk/remindor/indicator/"
license=(GPL)
groups=(unity-extra)
depends=(python2-dateutil python2-dbus python2-feedparser python2-requests)
makedepends=(python2-distutils-extra)
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/r/remindor-common/remindor-common_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=('d782123e47757d4050944760b5ec92e2c27a30681ba4523a70616285d06ec8b099a4ea510badde1d7816dd6965804acaec0297fd9ae06dff3ff5c7349d40f452')

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
