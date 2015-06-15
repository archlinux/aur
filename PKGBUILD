# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=java-card-development-kit
pkgver=2.2.2
pkgrel=1
pkgdesc='Java Card Development Kit'
url='http://www.oracle.com/technetwork/java/javame/javacard/'
license=('custom')
arch=('any')
depends=('java-environment>=6')
makedepends=('unzip')
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/java_card_kit/2.2.2/java_card_kit-2_2_2-linux.zip")
md5sums=('c4222278d8a4e07190056ed4f122cfad')

package() {
  _dest="${pkgdir}/opt/java/lib/$pkgname"
  mkdir -p $_dest

  cd "${srcdir}/java_card_kit-2_2_2"
  for _z in *.zip; do
    unzip "${_z}" -d "${_dest}"
  done
}
