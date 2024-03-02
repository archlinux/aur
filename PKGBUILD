# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.9
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

sha512sums_x86_64=('3d9b080e80982caada38603b6032bef414649b763b9c98b27ac4ff2c4e199edec83b7f8a9199da2a74b3df118aca18257c6c031cffc0e9943478ddd5f61f86e0')
sha512sums_i686=('3b28ffc1b18c5d0b7bdf47a430ac9a8f535e794fa9b070e1883a32e28cb4235d53bd34af4a281a348c7f76c5043846a08f8e193e90b383f55352b6f1870dfa13')
sha512sums_aarch64=('346dd884096ec1e4990ac562b8c8a7022bf5e7459a47ac547d4703f4db7a85ec3e88805b44cca99a94e1cbb602bfbc3a171e11f0745b33b540972cf08774ab9d')
sha512sums_armv7h=('fb632baac70daee8b6ca63aa6772a1ce9d3e1c35a06cb0052f473de35bd434df7c6106a80ecd7a61efc93c6eabffd02f320cd48804a8b5474d65683f008f95a3')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
