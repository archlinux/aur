# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
pkgver=0.1.5
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel' 'xdotool')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('65a2f0774f1d257ca3d7b1f76186a05bf50d5e779698e5507e74d6cba7addfe628ea0669cd20a1e679c48674b430835451eb3ae35f2710dba2b4cf874cea47d1')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
