# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=1.11.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")
source_i686=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_i386.deb")
source_aarch64=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_arm64.deb")
source_armv7h=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_armhf.deb")

sha512sums_x86_64=('65c064405c94498fbc1be6cceb80aab08fdf3cb37ca5b314eb2e0c21c47ed46a2009cfd22d5a1349f2edea01f5ca55d7021d1c0c7e10301574aaf6ba77a08be8')
sha512sums_i686=('65c064405c94498fbc1be6cceb80aab08fdf3cb37ca5b314eb2e0c21c47ed46a2009cfd22d5a1349f2edea01f5ca55d7021d1c0c7e10301574aaf6ba77a08be8')
sha512sums_aarch64=('65c064405c94498fbc1be6cceb80aab08fdf3cb37ca5b314eb2e0c21c47ed46a2009cfd22d5a1349f2edea01f5ca55d7021d1c0c7e10301574aaf6ba77a08be8')
sha512sums_armv7h=('65c064405c94498fbc1be6cceb80aab08fdf3cb37ca5b314eb2e0c21c47ed46a2009cfd22d5a1349f2edea01f5ca55d7021d1c0c7e10301574aaf6ba77a08be8')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
