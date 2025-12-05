# Maintainer: Egor Gavrilov (gavrilovegor519-2@yandex.ru)
pkgbase=gigabyte-gaming-gimate-archlinux-configs
pkgname=gigabyte-gaming-gimate-archlinux-configs
pkgver=0.3.0
pkgrel=1
pkgdesc="Configs for Gigabyte Gaming GiMATE-enabled laptops"
arch=(any)
url="https://github.com/oldzoomer-ru/gigabyte-gaming-gimate-archlinux-configs"
source=("https://raw.githubusercontent.com/oldzoomer-ru/gigabyte-gaming-gimate-archlinux-configs/master/99-gigabyte.hwdb")
sha256sums=('SKIP')
license=('0BSD')

package() {
  # Copy config files
  install -Dm644 "${srcdir}/99-gigabyte.hwdb" "${pkgdir}/usr/lib/udev/hwdb.d/99-gigabyte.hwdb"
}
