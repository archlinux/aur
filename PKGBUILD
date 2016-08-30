# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=gajim-omemo
pkgver=0.9
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://github.com/omemo/${_pkgname}"
license=('GPL')
depends=("gajim" "python2-setuptools" "python2-cryptography" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://github.com/omemo/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('536d0a9e368dadefefba34b02e74194c314eb0fc6343fcbb64390b7e447fb8be0214e921359959f831d0bcfaef09ae6825110ebeea947ac5a5ef3bc73da72541')

package() {
  cd $srcdir/gajim-omemo-${pkgver}
  rm -r CHANGELOG COPYING doc pkgs README.md
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
