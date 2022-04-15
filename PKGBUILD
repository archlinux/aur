# Maintainer: jackmeima <likepeigen@gmail.com>

pkgname=prettyzoo
# the versin is from deb package
pkgver=1.9.6
pkgrel=0
pkgdesc="a GUI for Zookeeper created by JavaFX and Apache Curator Framework."
arch=("x86_64")
url="https://github.com/vran-dev/PrettyZoo"
license=('custom')
depends=('jdk8-openjdk')
provides=('prettyzoo' "$pkgname")
conflicts=("$pkgname")
source=("https://github.com/vran-dev/PrettyZoo/releases/download/v1.9.6/prettyzoo_1.9.6-1_amd64.deb") 

md5sums=('27c89e2911792e42196e809575ad77ca')

package() {
    tar xf data.tar.xz -C ${pkgdir}/
    chmod 755 ${pkgdir}"/opt/prettyzoo/" \
              ${pkgdir}"/opt/prettyzoo/bin/" 

    mkdir -p ${pkgdir}"/usr/share/applications/"
    cp ${pkgdir}"/opt/prettyzoo/lib/prettyzoo-prettyZoo.desktop"  ${pkgdir}"/usr/share/applications/"

}