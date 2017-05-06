# Contributor: Chris Chapman chris(dot)chapman(at)aggiemail(dot)usu(dot)edu
pkgname=eclipse-plantuml
pkgver=1.0.6.4860
pkgrel=1
pkgdesc="PlantUML integration into Eclipse"
arch=('i686' 'x86_64')
url="http://plantuml.sourceforge.net/eclipse.html"
license=('EPL')
depends=("graphviz" "eclipse>=3.2")
source=("http://hivelocity.dl.sourceforge.net/project/plantuml/net.sourceforge.plantuml.eclipse_${pkgver}.jar")
md5sums=('d8851e4af502a0440d70e8c12a7d382f')

package() {

    _dest=${pkgdir}/usr/share/eclipse/plugins/

    cd ${srcdir}

    install -d ${_dest}
   
    install -Dm644 net.sourceforge.plantuml.eclipse_${pkgver}.jar ${_dest}
}
