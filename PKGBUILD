# Maintainer: jackmeima <likepeigen@gmail.com>

pkgname=prettyzoo
# the versin is from deb package
pkgver=2.1.1
pkgrel=0
pkgdesc="a GUI for Zookeeper created by JavaFX and Apache Curator Framework."
arch=("x86_64")
url="https://github.com/vran-dev/PrettyZoo"
license=('custom')
depends=('jdk8-openjdk')
provides=('prettyzoo' "$pkgname")
conflicts=("$pkgname")
source=("https://github.com/vran-dev/PrettyZoo/releases/download/v2.1.1/prettyzoo_2.1.1_amd64.deb") 

md5sums=('5060164137922ba664b81e6dce903500')

package() {
    tar xf data.tar.zst -C ${pkgdir}/
    chmod 755 ${pkgdir}"/opt/prettyzoo/" \
              ${pkgdir}"/opt/prettyzoo/bin/" 

    mkdir -p ${pkgdir}"/usr/share/applications/"
    cp ${pkgdir}"/opt/prettyzoo/lib/prettyzoo-prettyZoo.desktop"  ${pkgdir}"/usr/share/applications/"

}