# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.2.0
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('10a2022cf29c9c8c1176003f477b6afc87f32a458642d060bda9ae5da5f3be259468b255d79379f6a4fda86a7d12c0c554d4fe8d45205ddf5e6df2e940b34938')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
