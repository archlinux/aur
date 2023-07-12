# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=1.8.1
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr')

source=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('c8a6d40cf15e50c46138f485e478dc931edae208a3a5003685d2e703d10b135d9db95033abf69b5cc12bfae6fabf5e6e4666f7f78ce70b31d9ef2b04d98c53ff')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
