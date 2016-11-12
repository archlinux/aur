# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=gajim-omemo
pkgver=0.9.7
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://github.com/omemo/${_pkgname}"
license=('GPL')
depends=("gajim" "python2-setuptools" "python2-cryptography" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://github.com/omemo/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('30a90b14f49b2817370a9e93f53ded3df0f6fec7f8dc6020ff36880fac13b298bd9c518a746f4af7bca877fee39d3995dae587218485f4b767d3eadfc1c7bd04')

package() {
  cd $srcdir/gajim-omemo-${pkgver}
  rm -r CHANGELOG COPYING doc pkgs README.md
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
