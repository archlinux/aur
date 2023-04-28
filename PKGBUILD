# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname="ipfs-dlagent"
pkgver=0.1
pkgrel=1
pkgdesc="makepkg download agent for IPFS URIs."
arch=('any')
url="https://aur.archlinux.org/packages/ipfs-dlagent"
depends=("kubo")
license=("AGPL3")
source=("ipfs-dlagent.sh"
        "makepkg.conf")
sha256sums=("3799c6d87a473f9f1b05791bbee349cdf3a97207cb3467da5d110e2e7fd39334" 
            "499743e52fb5d3d7fec5f26d1aa560a76d6f89858335182cd67748df7e4f63a1")

package() {
  local _dest="${pkgdir}/usr/share/${pkgname}"
  local _bin="${pkgdir}/usr/bin"
  install -Dm755 "${pkgname}.sh" "${_bin}/${pkgname}"
  install -Dm644 "makepkg.conf" "${_dest}"
}
