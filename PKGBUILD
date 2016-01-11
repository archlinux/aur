# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=gajim-omemo
pkgver=0.3
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://github.com/kalkin/${_pkgname}"
license=('GPL')
depends=("gajim" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://github.com/kalkin/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0f4f1c1d6b799c3a6c159d33b4c65367da038db75f169793f13d2710b93d3651489cccd17b3782093a3a76324d701dbf9facacd373526f70e9c274e21f9f2b57')

package() {
  cd $srcdir/gajim-omemo-${pkgver}
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
