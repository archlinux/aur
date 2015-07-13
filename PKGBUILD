# Maintainer: onefire <onefire.myself@gmal.com>
pkgname=eclipse-bibsonomy
pkgver=0.1.1
pkgrel=1
pkgdesc="This texlipse extension adds Bibsonomy support for Eclipse."
url="http://texlipse.sourceforge.net/"
depends=('eclipse>=3.3' 'texlive-core' 'texlipse')
arch=('any')
license=('EPL')
source=("http://gforge.cs.uni-kassel.de/frs/download.php/84/org.bibsonomy.texlipseextension_${pkgver}.jar")
sha256sums=('8e1b7ba71d6e55c3e7e84cb2059b8f1182e4491088df634758cfef0694c49aa8')

package() {
  install -Dm 755 org.bibsonomy.texlipseextension_"${pkgver}".jar "${pkgdir}"/usr/share/eclipse/dropins/org.bibsonomy.texlipseextension_"${pkgver}".jar
}

