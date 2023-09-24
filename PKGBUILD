# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.5.0
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

sha512sums_x86_64=('aa6bb0d450483d61153ee68cbe98edf505002bf11eac2e2b917800c1e82178950970ab65adcb0bbd3f40f6d20c563856a3a642006be74a90a29b40a5b8e068b7')
sha512sums_i686=('e3c19752ed8775518466fa0627622f8c63d2d72c5bbea410f379499382073f741f03c34f1a6374f61f662cdfd3f3ea2dc4f2d1fa2d8b38f482a6a6a1ff457522')
sha512sums_aarch64=('fec61308e15cff47b0f5443f762ff6ee69838b8c172f1248e55587709e09731d479c61af9bd5c28ae5e4385fcc02ca2888c650aa59defa74bdc77c6c378fe6e3')
sha512sums_armv7h=('10ff7a30c32ac45b34cf792cb19ada3dd0346e894babde74751d3580836fb1270a150bbb59442f69ad6b843a5dfe496361d634f7756425b61cea1be322f730e9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
