# Maintainer: Daniel Stumpner <bigstumpi@gmx.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=leet-plugins
_pkgname=LEET-plugins
_subname=leetplugins
pkgver=0.2
pkgrel=1
pkgdesc="Ladspa Plugins for use with ardour"
arch=(i686 x86_64)
url="http://code.google.com/p/leetplugins/"
license=('GPL2')
depends=('gcc-libs')
source=("http://$_subname.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
md5sums=('9bd803f4a204a78686ffd8df82f1e5ce')


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make all
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
install -Dm 755 LEET_chorus.so ${pkgdir}/usr/lib/ladspa/LEET_chorus.so
install -Dm 755 LEET_eqbw2x2_1.so ${pkgdir}/usr/lib/ladspa/LEET_eqbw2x2_1.so
install -Dm 755 LEET_eqbw2x2.so ${pkgdir}/usr/lib/ladspa/LEET_eqbw2x2.so

}
