# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=gajim-omemo
pkgver=0.4
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://github.com/omemo/${_pkgname}"
license=('GPL')
depends=("gajim" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://github.com/omemo/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2ab28e40153bbcb37d1ba7993265ecf1747ffc54d1f617e074aef5bfb416aab2e864b72f2c0b073f4e3fb2bc0c926f63497c0fc7b18d48cf9e1333db0e268279')

package() {
  cd $srcdir/gajim-omemo-${pkgver}
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
