# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=1.11.1
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

sha512sums_x86_64=('65c064405c94498fbc1be6cceb80aab08fdf3cb37ca5b314eb2e0c21c47ed46a2009cfd22d5a1349f2edea01f5ca55d7021d1c0c7e10301574aaf6ba77a08be8')
sha512sums_i686=('4758bd870170c6c04ba05070a3eed97c2fdb21b5cbbd36cd96252da99e29e87833f4d6c6bcb9b2dc317e20bc4eb06ed344214a3b005d18707596c2c9cbd685c3')
sha512sums_aarch64=('43d4396019c9183236246bad7e867466ed6cdfa143cf1f6bc4b90fc09f912331aad1b6932b5a066e1bf24b0e5df24537aae2dbdceecaab4b62074a83a8e52b12')
sha512sums_armv7h=('8687f4752e0eb0b72e3894f68a794ff218cb637a0552c272fc19499875e447b55dc28146762d115b7d35fe7f210a98e7131aec29c690de073b8f03fedb1ab571')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
