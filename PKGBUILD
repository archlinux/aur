# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.4
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

sha512sums_x86_64=('ea93fb2ea5572051edd9ee14954ad940db5a4bbe6daa3fb274e0c3fdc81eade22ce54e601007db33779a449dbac9e24f432b4bb91f3ac19298aab5a144ec5b45')
sha512sums_i686=('6612b44769ee6f9c58da2acdc645425846a5d47e2f68d04eb90222416b8d0da0cd644783681d62049b44595adf9d4e25621fc3d6618098c1592824545c5c5fba')
sha512sums_aarch64=('3007273679c30cf00451f82952ec117b9f0b3af65d272b586980c99284212f8fedad9490e4a4167c436f35f69f2418696089d08a92d6b2e981d8de44c123066c')
sha512sums_armv7h=('9811e5ace423d5adbaa5b61fd8337c3aeb5cc80e7a9fbfce0f4525bc675f687d051d4e818f752506af914458c126432232143e6a66ba4a6d943321fe4ea4c1ec')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
