# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.6.3
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

sha512sums_x86_64=('f0a160a30f6c2c9d08210751aafe6e1dbaedee1d080e99f3d18b5f94edf01c1941cb9d03ce718d8f5b3f421f1b9646141fb5f32bdde2c0fdc839022570350159')
sha512sums_i686=('ec3e4757f50ec6f891d5de9944f1085aa097b5e2017ba25f279179b08184299ab3bc02b36031aa2450ea8501f30256dbf53b3baf1889a1508f2f0aecac9e0c88')
sha512sums_aarch64=('870c50999829434c6102337ee0bc3cf531eadfb9c4ce4e57565550702f404acabdcf958fce8ef2de940028f4d7550cb7086482f4f2c789d84508ddffe739e33b')
sha512sums_armv7h=('34fafb86c34b2e1978f0a630f8c223d56c8d8c113069265dc2add38c1bd986f9530b702ea11b9f11b95b7baf0a91af201fd36031ce557b230b43ba46b956b4f8')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
