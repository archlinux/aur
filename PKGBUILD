# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.8
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

sha512sums_x86_64=('b7cea217bab1206c0154dd65c5552fca6af5e0ff2920ebb062e27b6df8f139a9ec62d1efc9aa54f21fd3de380be45b3eb5a14124574bdc4d14daa1e0629ca9f5')
sha512sums_i686=('758760e3326f34fe92a7e933d8aefc48975b26c8d990d8df66d42b4027cb4ec2f40a2875db90c3e9b72d4bd34f7cce2400cd806394b4837c90878b041a1b0788')
sha512sums_aarch64=('f347b0ddad5780204449df42c3add2abafbbc142ec5a46338b121fc5b470ef887e606db45a241989c921d1ccbeb04e29152ae7ddde89b755641e01427d5d65d0')
sha512sums_armv7h=('e51134c5ed233ff81e4cd7f437f0ab50f4c9187a7009912550bbb9d3bf8b54798fc043ce67649d4d60bece10c021a479915794b9a1a39ae763fcbeb366895e3c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
