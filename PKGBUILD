# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=gajim-omemo
pkgver=0.7.5
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://github.com/omemo/${_pkgname}"
license=('GPL')
depends=("gajim" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://github.com/omemo/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('5a74b836c5197894ae1a26fab93f3edaa354aeb5ab068f3b82e5609678705728709a76b9fc2e3249931f37940da7e6d3b339ddba424254095fde269fb56f001d')

package() {
  cd $srcdir/gajim-omemo-${pkgver}
  rm -r CHANGELOG COPYING doc pkgs README.md
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
