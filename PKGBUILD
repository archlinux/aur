# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.5.1
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

sha512sums_x86_64=('5b4e9190a1f28ef1d104f52d7d29cb8553a48332be026708346d155d7ea24d2d25e267286b1e549cb6e2f4127f111498b39f8480af4350400d646bcd643676b6')
sha512sums_i686=('44d85286ce15b99c946310239a591c33812d3de8b1f57129c79c1901275efde294e117c52a4ea5c2d7769e4fdbb2ecc6b02d0a3f1d41cd6c932da648f769744d')
sha512sums_aarch64=('37f41be519c91e109d13fe05bb5c1649df293bfa0fbfa71860b5e76d1a5ad23ad7acb08b1da8117f769e05e5b4aafa6f2ff78af8170a206e6af917e940dff03c')
sha512sums_armv7h=('be7ebaca10876efab707b66b6bc3ec4a0677f0e7e6b5ca2cdd63e8b1b0c02fcc08e908c36541c11f0dc8885e52ef5d662da85c72025ab178b42820db6f66d933')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
