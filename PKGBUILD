# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.2.1
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

sha512sums_x86_64=('89edcf4c9d9fdcc9859bcbf19827416db6f7760184039e44dcd111770b62352e80181e033a8fc32da548b4dcdaf264209d86c47ca3265a41b77d41b20fe7c6d4')
sha512sums_i686=('2b9e7823187ecef5ebc6a4f496260db9f939465afbd0ba309bff0aece0a214d3928186d4b7b63fcc3a429b14a2b985405b48f194ccc2dc56ea73a57bbc849c12')
sha512sums_aarch64=('d30e2563245b3551d1381c2a9fd95acfdc4a0e8b155650ed8fd40600aefd5a64d7e472197828b9aa9497770a3083330be0686a84f8565947d59857391d3b910a')
sha512sums_armv7h=('030a0d48ad6f5a523ee2da9bc46dbad444b2f35e6ff55e0a41da97920c0a2036a356bb884b81079571b18c7d5b66ef44e86e63fc89e72ace543a0dc3cfe453a2')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
