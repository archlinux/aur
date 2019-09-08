# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=raspberrypi-stop-initramfs
pkgver=1
pkgrel=1
pkgdesc="Prevent kernel updates on RPix from generating useless kernel images"
arch=('armv6h' 'armv7h')

package() {
  install -d "$pkgdir/etc/pacman.d/hooks"
  ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-linux-raspberrypi.hook"
}
