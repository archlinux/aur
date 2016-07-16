# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=gajim-omemo
pkgver=0.7.0
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://github.com/omemo/${_pkgname}"
license=('GPL')
depends=("gajim" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://github.com/omemo/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ca110c26ed43c5fbd189e0c65d9d16224abb81d02d43e8c25f34de10eeb1e59cd3e1ba1568abbf2b9a0c3cb3a8ff3ecc9e7c30f3c6bd96a512eb365b9c117725')

package() {
  cd $srcdir/gajim-omemo-${pkgver}
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
