# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname="ipfs-dlagent"
pkgver=0.1
pkgrel=1
pkgdesc="makepkg download agent for IPFS URIs."
arch=('any')
url="https://aur.archlinux.org/packages/ipfs-dlagent"
depends=("kubo")
license=("AGPL3")
source=("ipfs-dlagent.sh")
sha256sums=("SKIP")

package() {
  local _dest="${pkgdir}/usr/share/${pkgname}"
  local _bin="${pkgdir}/usr/bin"
  install -Dm755 "${pkgname}.sh" "${_bin}/${pkgname}"
  install -Dm644 "makepkg.conf" "${_dest}"
}
