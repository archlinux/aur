# Contributor: kaptoxic (at) yahoo (dot) com
# Contributor: Chris Chapman chris(dot)chapman(at)aggiemail(dot)usu(dot)edu
pkgname=eclipse-plantuml
pkgver=1.1.18.201704180954
pkgrel=1
pkgdesc="PlantUML integration into Eclipse"
arch=('i686' 'x86_64')
url="http://plantuml.sourceforge.net/eclipse.html"
license=('EPL')
depends=("graphviz" "eclipse>=3.2")
source=("http://files.idi.ntnu.no/publish/plantuml/repository/plugins/net.sourceforge.plantuml.eclipse_${pkgver}.jar")
md5sums=('f12c5b23aabce943fb98f1e8574b0a67')

package() {

    _dest=${pkgdir}/usr/share/eclipse/plugins/

    cd ${srcdir}

    install -d ${_dest}
   
    install -Dm644 net.sourceforge.plantuml.eclipse_${pkgver}.jar ${_dest}
}
