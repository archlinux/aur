# Maintainer: jackmeima <likepeigen@gmail.com>

pkgname=prettyzoo
# the versin is from deb package
pkgver=1.9.3
pkgrel=0
pkgdesc="a GUI for Zookeeper created by JavaFX and Apache Curator Framework."
arch=("x86_64")
url="https://github.com/vran-dev/PrettyZoo"
license=('custom')
depends=('jdk8-openjdk')
provides=('prettyzoo' "$pkgname")
conflicts=("$pkgname")
source=("https://github.com/vran-dev/PrettyZoo/releases/download/v1.9.3/prettyzoo_1.9.3-1_amd64.deb") 

md5sums=('b942b2400d7da719a71f232fe0d459f4')

package() {
    tar xf data.tar.xz -C ${pkgdir}/
    chmod 755 ${pkgdir}"/opt/prettyzoo/" \
              ${pkgdir}"/opt/prettyzoo/bin/" 

    mkdir -p ${pkgdir}"/usr/share/applications/"
    cp ${pkgdir}"/opt/prettyzoo/lib/prettyzoo-prettyZoo.desktop"  ${pkgdir}"/usr/share/applications/"

}