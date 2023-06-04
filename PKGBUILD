# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.5.1
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool')

source=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('95d2ce738f5a86884687a208df7ce6a2f34ac5f28d6c940561225dae21dcde0ab6af8ad2ddda00e8f9745e5791cf18acddd1784f565409d79ee8c3e967f20506')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
