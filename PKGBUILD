# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.1
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

sha512sums_x86_64=('ccdcfdeed9c4da64dd679eb0b65151b6eaedfc173e6767de551968d6590c746d3e3394048d792290e73fc70cdab5a62030411836815f315f9fac8f3c7bfe88f1')
sha512sums_i686=('5bf9c9fea30338fcae67cae97f2581533b9c8294d6d27135da87f7cfb07f6058e9f76fb17a87ff23b0ee55c2b5ddd79c05a6c2c6423aa8e488bfd2abd09d946b')
sha512sums_aarch64=('79462d2fac9a452dd1785a689b5c2b607541ef49d35d57fe01b0b800d4e5fd825ed2a7d49cd365f26571679113f6a721d0345e51dc94d8a108fb45eb436506b8')
sha512sums_armv7h=('9851d6f75d9d223616ed50741559bf9297d658ff86915bedcc7f1d696d7a11c22fa420408d519c24288cbb9681237d8c5322aa8d07a64fa72fe2574a361d2c47')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
