# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.3.2
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')

source=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('9bbe0420d98095e53100a89d7d5155b1bc119fc638d3cb42e145a92c3af5c9c1dc0acf684ec04a7f0959e354187a29ab4f7c1937c4f9c79557d82ef1bb5c12ad')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
