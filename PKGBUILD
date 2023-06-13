# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=1.4.1
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr')

source=("${prjname}-${pkgver}-${arch}.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('dc0e56c700c73ff3594eb07d9ae74eed7ff4ba7e3cef1f36a5661c69eb12d4dd946c3cc1604cebd9b91c23fa9f35f40197b3503df86e09ad79a1bb8284d4fcfc')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
