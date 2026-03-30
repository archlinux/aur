pkgname=tuidoro-bin
_pkgname=tuidoro
pkgver=0.1.0
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
sha256sums=("3e48b8867a9e286b9c6f4e7eef0e716c396b525240f2a98275b51e8f2a8ab7b9")
options=("!strip")

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
