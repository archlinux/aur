# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.3.0
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')

source=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('4ba75bb5660cb8ceaec17ed4fd2cd4391b38e537b18ae2fc4f2ee7890c513cac671dbf326b4456328fa727345bdccb9e6a1b8ad3b7c37c2e8aae668ecf8ae843')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
