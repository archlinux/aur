# Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-orbit-com-google-inject
pkgver=3.0.0
_orbittime=R20190726180751
_buildtime=v201605172100
pkgrel=1
pkgdesc='Google Guice Core Library for Eclipse IDE from Orbit'
url='https://download.eclipse.org/tools/orbit/downloads/'
arch=('any')
license=('EPL')
depends=('eclipse')
makedepends=('java-environment-common')
options=(!strip)
# https://download.eclipse.org/tools/orbit/downloads/drops/R20190726180751/repository/plugins/com.google.inject_3.0.0.v201605172100.jar
# https://download.eclipse.org//modeling/m2t/xpand/downloads/drops/2.2.0/R201605260315/m2t-xpand-Update-2.2.0.zip
source=(
	https://download.eclipse.org/tools/orbit/downloads/drops/${_orbittime}/repository/plugins/com.google.inject_${pkgver}.${_buildtime}.jar
)
sha256sums=('1223ae8933180c43d8595fda1007430e69cbf1cf538948182f1978883b9cc63b')

package() {
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  install -Dm644 com.google.inject_${pkgver}.${_buildtime}.jar ${_dest}/plugins/com.google.inject_${pkgver}.${_buildtime}.jar
}
