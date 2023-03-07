# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
prjname=pot
pkgver=0.0.4
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('1b1a898518ea753f68c879c8c2195c0b878035d1220415c8846f08546b2dca242c0736824d8459ceb299a73aad4064af5b52f60a86614a130941544fdacf4a3d')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
