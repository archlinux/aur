pkgname=tuidoro-bin
_pkgname=tuidoro
pkgver=0.1.1
pkgrel=1
pkgdesc="TUIdoro - minimal pomodoro timer that runs in your terminal"
arch=('x86_64')
url="https://github.com/b12o/tuidoro"
license=('MIT')
depends=('libpulse')
makedepends=('unzip')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=(
  "$_pkgname.zip::https://github.com/b12o/tuidoro/releases/download/v${pkgver}/${_pkgname}.zip"
)
sha256sums=("e12188b619e0384773804168a5b8c39083219ad662caff3dd98552db00e172f3")
options=("!strip")

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
