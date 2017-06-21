# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=indicator-remindor
pkgver=15.09
_ppa_rel=0ubuntu1~wily
pkgrel=1
pkgdesc="Schedule reminders easily from an indicator"
arch=(any)
url="https://launchpad.net/indicator-remindor"
license=(GPL)
depends=(gstreamer0.10 gtk3 libappindicator-gtk3 libnotify python2-dateutil
         python2-dbus python2-feedparser python2-requests remindor-common)
makedepends=(python2-distutils-extra)
optdepends=('yelp: Help stuff')
install=indicator-remindor.install
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/i/indicator-remindor/indicator-remindor_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=("1a1dd41be1929b25bf09ffbc12ad779fe1ca8609ab0ab441b208920dff1294922039975b7c6afa3126b0aea56bfaa0ebd52f10c6e515e1a83e77bc0a306d8804")

package() {
    cd "${pkgname}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
