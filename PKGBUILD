# Maintainer: Chris Chapman <chris.chapman at aggiemail.usu.edu>

pkgname=eclipse-imp
pkgver=0.1
_pkgdate=201004212015
pkgrel=1
pkgdesc="The IDE Meta-Tooling Platform for Eclipse"
arch=('any')
url="http://www.eclipse.org/imp/"
license=('GPL3')
depends=('eclipse>=3.5')
source=(http://download.eclipse.org/technology/imp/org.eclipse.imp.update_${pkgver}.v${_pkgdate}.zip)

build() {
  local dest=${pkgdir}/usr/share/eclipse/dropins/imp/eclipse
  install -d ${dest}
  cp -r ${srcdir}/{features,plugins} ${dest} || return 1
}

md5sums=('c1dd0ca43f38654cedf1cf5114052265')
