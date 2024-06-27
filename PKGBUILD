# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=3.0.5
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

sha512sums_x86_64=('0d2a7e723fb8b3893f25718946540b2ea45a05c54e02d7fea474bd8a699c4bfad50a8a1029f4d4cd6dbc77a01b6f798f7b82b796c5343d4542c19cbc9b0ee6ee')
sha512sums_i686=('a21ef57c5e2e352242b8bbef65315b7e59d0ccf0e23121a0ceaea5c7663e2d57ec78f2d2d5d9d2d65ec2ca5fc58dba8c2fbc9f177462ff6934f9f2894eb6dfae')
sha512sums_aarch64=('c2e8662aa9929d5fab3db4477877f1566c78c76f117965c381b56e218d52feea8c1eb1f98a6897c46f847d622a5a0b33a752a1719163818e667e4b6bb5d8c9f6')
sha512sums_armv7h=('1289e919841d4e9471740ccce818cc07722cec6c91c7885492f737519000e179d8b14cbf59d410996fcdb5fe321e5955902d86fcf2ba9063d104c342259e6f65')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
