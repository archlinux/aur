# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
prjname=pot
pkgver=0.0.3
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('ea5978115deef0cdc54af74e4e0ba0b3b1c435cf6d28994179666313308a261d45bbe59aa3c6101542af78c8c300bfb16c0a75fab3513d3e07dea07065242f77')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
