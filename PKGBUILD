# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=3.0.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")
source_i686=("${prjname}-${pkgver}-i686.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_i386.deb")
source_aarch64=("${prjname}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_arm64.deb")
source_armv7h=("${prjname}-${pkgver}-armv7h.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_armhf.deb")

sha512sums_x86_64=('e9dff4996dd9d7579a70a419536727d51a63a6f4de0e9a6969dc36761a0c52c4b487088401425c396eff40f0fc7179cb8bdb9d086d51821f591583c82db87d4e')
sha512sums_i686=('e821fa89554154ef8db2153ada4271f8ee5e511c9dd409c83e33534558cac2fe44eabfcc39662cd6bf11f84d0138775c7d81abb6a4423711653eeed9aedc2c3e')
sha512sums_aarch64=('633de17ca910d8b64586fd3d130e07e68d440d2a2bb0c50b93fa6a80d3cc49b56084c7a2dac1d67c6d01ec5f20022bca31065b20d4c5636976c418140bb16ad7')
sha512sums_armv7h=('9d3cba1569639d294745649f7e81dda1cc1be9f35ea5e277ac0997d38325f7441d92d2420e267bf2686297bbb30ca458fd528d1f279dbd9388537442246172cb')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
