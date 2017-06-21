# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ppa: name=${pkgname}, url=ppa:bhdouglass/indicator-remindor, native

pkgname=remindor-common
pkgver=15.06.2
_ppa_rel=0ubuntu1~wily
pkgrel=1
pkgdesc="Common files for indicator-remindor and remindor-qt"
arch=(any)
url="http://bhdouglass.tk/remindor/indicator/"
license=(GPL)
groups=(unity-extra)
depends=(python2-dateutil python2-dbus python2-feedparser python2-requests)
makedepends=(python2-distutils-extra)
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/r/remindor-common/remindor-common_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=('47b0dfe04dc868673c748d2b71da9fda478958d67576cec9e0ee51b86b30eeb481a3a58fd5e0c40d1b7395483d760b8d6107034fa794158f7852c0eecd9c1ed2')

package() {
    cd "${pkgname}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
