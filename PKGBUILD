# Maintainer: graysky <therealgraysky AT protonmail DOT com>
pkgname=raspberrypi-stop-initramfs
pkgver=4
pkgrel=1
pkgdesc="Prevent kernel updates on RPix from generating useless kernel images"
arch=('armv6h' 'armv7h' 'aarch64')
install=readme.install

package() {
  install -d "$pkgdir/etc/pacman.d/hooks"
  ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-linux-rpi.hook"
  ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-linux-rpi-legacy.hook"
  ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
}
