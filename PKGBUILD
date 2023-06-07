# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=1.0.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrender' 'dbus')

source=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('1c9a70911b33cdceb99abd1a315ce4f4a7af4baa825151b8ef4e347e9fe2afb987f39fa68a71f443609e129ed08022c2bb1b5bb69e3407a5b79ebe607fc62b8c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
