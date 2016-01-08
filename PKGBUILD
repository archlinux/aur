# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=gajim-omemo
pkgver=0.2
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://github.com/kalkin/${_pkgname}"
license=('GPL')
depends=("gajim" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://github.com/kalkin/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c7a5f78011c3c2fcce03871620a5980fb3b8a2450e46d8e640e19f2bd0c058a89710ccddd051b135098509c46ef2cb2300256de9550df188149a148778f1a0c2')

package() {
  cd $srcdir/gajim-omemo-${pkgver}
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
