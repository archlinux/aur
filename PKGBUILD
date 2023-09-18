# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.4.3
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

sha512sums_x86_64=('ae006d255b6f7c81844f3e87f569a434c7bcdbb4e48c3121c1d48fd09dbaf94d1a05afccc210eb7ac14411dca913cc3eff08516c66cc25444f632c384264deff')
sha512sums_i686=('cd72d146d0b949d54c0d6e9672c5baae079563474a616bf6147f7e8f4481bc1024b759439d0dc0eddfec1ea36a78ffbd90896ec640d48ee48e9c61f203e5c8ec')
sha512sums_aarch64=('8dcab15f0e3ee70839cdbae1fa5da3593dd30b865a4cb3178a84fae320a0f587ab84b7ec50e5c9b63c1602eda9935fa9045f0253935a6bb3c495df2f5290aac8')
sha512sums_armv7h=('e86482ca6693042538f195c0dd229518777f46bbbaf367c76035ac2dbc1e99d308ec45bd76cee8ad5afa3f9ac7bcec437a5cad8df65ce992755141fa94b53f8c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
