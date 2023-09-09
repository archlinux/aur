# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.2.0
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

sha512sums_x86_64=('9102adc61a549e3de3d97a8ea5ecdec5538c6629540896312f1c092304520785bbdb02c673035bea57a848597934e94d9eefa7b8ea0f6cdab039a2abde062e60')
sha512sums_i686=('bd9ae0cbf7611f60aa7269828d49cd2ca1b7316b24d9a42ad8f269b4cffb1c73c0ebd56e51c82ce4dabb592d306fbc3661a912150a645092e4a766b3e48fe7cc')
sha512sums_aarch64=('2b8492ab31fabcb74e162f705f3fe2794be6999a7b0c9e3730884be51931313fa525abe22916718cc4491b0269863381dfff9478040602024d5ee6acc8ba5fd0')
sha512sums_armv7h=('825ac7139174f9a322a9671025e9c25c778f01cc339ae3fac733faaf09d3245a822dc7f5d4326f52b498e8a5facd7fa81987a6952ee44e815b49d2475e076883')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
