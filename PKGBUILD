# Maintainer: Andrej Marolt <andrej.marolt@gmail.com>
pkgname=jboss-forge-offline
_forge_version=3.4.0.Final
pkgver=3.4.0
pkgrel=1
pkgdesc="JBoss Forge is the Fastest way to build Maven-based Java EE projects, and anything else you fancy."
arch=('i686' 'x86_64')
# url="https://github.com/forge/core"
url="http://forge.jboss.org/"
license=('EPL')
depends=('java-environment')
optdepends=()
install=${pkgname}.install
# source=("http://downloads.jboss.org/forge/releases/${_forge_version}/forge-distribution-${_forge_version}-offline.zip")
source=("https://oss.sonatype.org/service/local/repositories/releases/content/org/jboss/forge/forge-distribution/${_forge_version}/forge-distribution-${_forge_version}-offline.zip")
md5sums=('468da0acb5a004b806416d3839500493')

package() {
    cd "$srcdir/forge-distribution-${_forge_version}"
    install -d -m755 ${pkgdir}/opt/jboss/forge
    cp -r * ${pkgdir}/opt/jboss/forge/
}
