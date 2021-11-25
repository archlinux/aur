# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=ymuse-bin
_pkgname=ymuse
pkgver=0.18
pkgrel=1
pkgdesc="Easy, functional, and snappy client for Music Player Daemon (MPD)."
arch=('x86_64')
url="https://yktoo.com/en/software/ymuse/#software-downloads"
license=('Apache')
depends=('gtk3')
optdepends=('mpd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/yktoo/ymuse/releases/download/v0.18/${_pkgname}_${pkgver}_linux_amd64.deb")
noextract=("${_pkgname}_${pkgver}_linux_amd64.deb")
sha256sums=(
	"127742b13099773bdac4621046de64d86cdd2026f88c541e00bf7e5e19bf9055")

package() {
   bsdtar -O -xf "${_pkgname}_${pkgver}_linux_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
