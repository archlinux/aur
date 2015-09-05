# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-thunar
pkgver=1.2.8.35136
pkgrel=1
pkgdesc="Thunar integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync" "thunar" "thunarx-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/insync-thunar_1.2.8.35136-precise_all.deb")
sha256sums=("e030e547844738b830a5c4edcfb326901ef0719ac60ca172b9d76bf312625edf")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}
