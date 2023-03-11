# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.0.12
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel' 'xdotool')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('f074df8e16f83ad6b0185c2e8ebd2e0b7486f0d55dfb2fa6fd98ff4d5a23d68fe7ea1edba5bfa6aa98114d687d78585d15bad1ab85f21cd590954ae95f2d9627')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
