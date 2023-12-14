# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.2
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

sha512sums_x86_64=('4e2910384ddc2317b6a74bd03b4a7a46acdadf9f9b3fb9390929881dafbffd46b626c9d52a35bf6a1dd2d4a819813011bc8d99686f726957cef1f21c73389dbf')
sha512sums_i686=('ff6bb134f894ae4db78332f701d707312d56a575b39938a7e1011c5373046026f98197d31f070b89fc479123bd1f9b2c869498b8de5a08ef8c95a5d077ed92d0')
sha512sums_aarch64=('dff55e060189721761b6c7d41b49150e7d139e5429b89800e1c6680cf4bd63d3327f01b6442452d6f30fb2ebc36841c7654ca28e5a0aade7e1b9ddc6dce1e375')
sha512sums_armv7h=('a382366a86772fe3dfe9185949ae3c53ad356ae66f6a9052bb104b167d1a8a2a2211ef342e519dc9bd17e3bfc43d2f4a9fb5277f7ff4bacbb49769378dae3f82')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
