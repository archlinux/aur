# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.1.10
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('37fe58dd50aa897f3e5649d2f305a890e045128bc4824f3e89dcb7536a07a6f54d48a3ccb785ced1f23377770d35dd3f402432906a9984c94b21d4f23cad0460')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
