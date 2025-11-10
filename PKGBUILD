# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=hypr-wellbeing-bin
_pkgname=hypr-wellbeing
pkgver=0.0.8
pkgrel=3
pkgdesc="app usage logger for hyprland and niri"
arch=('x86_64')
url="https://github.com/DemonKingSwarn/hypr-wellbeing"
license=('GPL3')
optdepends=(hyprland niri)
provides=(hypr-wellbeing)
conflicts=()
replaces=()
backup=()
options=()
source=("${url}/releases/download/${pkgver}/${_pkgname}")
noextract=()
sha256sums=('SKIP')


package() {
	mkdir -p "${pkgdir}"/usr/bin
  chmod +x "${_pkgname}"
  cp -r "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
}
