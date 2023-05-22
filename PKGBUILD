# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.4.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool')

source=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('c5d28881e22f6f82e8da3e81cde85952766bfbe0dad765ba0aacf3abe9b1ed7a50020e3ee3672456645ac9cf76d60a03ecccf0d6baf885e05c2c97046fe35533')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
