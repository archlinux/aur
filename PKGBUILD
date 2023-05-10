# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.2.7
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('7d32b4f69c6f5797efc6b46fe58f96506b7ec24caae6b7b7e548cabcf6da10fe8f2ccdd2ea879590c6fbc2c99f0d12aa2f3ce3f047acecd1aa440520d8be92f5')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
