# Maintainer: Marcel Campello <marcel@basilio>
pkgname=nvidia-initramfs-pacman-hook

pkgver=1.0.0
pkgrel=1

pkgdesc='Update initramfs after a NVIDIA driver upgrade.'
arch=('any')
url="https://wiki.archlinux.org/title/NVIDIA#pacman_hook"
license=('GPL')

optdepends=('nvidia: it is the only reason to install this package')

source=('nvidia.hook')
sha256sums=('0e9934103e63e59c401125ab62434dc86ffbb4395071e79088598ddf8be6fc14')

package() {
  cd "${srcdir}"

  install nvidia.hook -t "${pkgdir}/etc/pacman.d/hooks" -Dm 0644
}
