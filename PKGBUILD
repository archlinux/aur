# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=raspberrypi-stop-initramfs
pkgver=3
pkgrel=2
pkgdesc="Prevent kernel updates on RPix from generating useless kernel images"
arch=('armv6h' 'armv7h' 'aarch64')
install=readme.install

package() {
  install -d "$pkgdir/etc/pacman.d/hooks"
  ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-linux-raspberrypi.hook"
  ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-linux-raspberrypi4.hook"
  ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
}
