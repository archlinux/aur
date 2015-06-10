# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=indicator-remindor
pkgver=15.06
_ppa_rel=0ubuntu1~vivid
pkgrel=1
pkgdesc="Schedule reminders easily from an indicator"
arch=(any)
url="https://launchpad.net/indicator-remindor"
license=(GPL)
depends=(gstreamer0.10 gtk3 libappindicator3 libnotify python2-dateutil
         python2-dbus python2-feedparser python2-requests remindor-common)
makedepends=(python2-distutils-extra)
optdepends=('yelp: Help stuff')
install=indicator-remindor.install
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/i/indicator-remindor/indicator-remindor_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=('8baf5761046b639a6e1ffa78076f852ac97814a45fc28363fd687907ab4199f0c6ad6344655c94c52de083b231ea2c89c832aa8b1f641dab08f19bbc558df6c1')

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
