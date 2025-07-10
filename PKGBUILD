# Maintainer: Giovani Flores <https://github.com/Jobanny-Friki>
# shellcheck disable=SC2034,SC2154
pkgname=festvox-palpc16k
pkgver=1.0
pkgrel=1
pkgdesc="Male Spanish voice Voz for Festival. (Pedro)"
arch=('any')
url="http://www.guadalinex.org"
license=('custom')
depends=('festival')
options=('!strip' '!emptydirs')
source=("https://raw.githubusercontent.com/guadalinex-archive/hispavoces/master/packages/festvox-palpc16k_1.0-1_all.deb")
sha256sums=('d367c7ca274f468c4c79258b664a3959a86d7523863d26d57a538b98cdfa4ac1')

package() {
    tar xf data.tar.gz -C "${pkgdir}" ./usr
}
