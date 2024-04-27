# Maintainer: Tarball <contact@trblwlf.net>
pkgname=nvidia-dracut-hook
pkgver=3
pkgrel=2
pkgdesc="NVIDIA initramfs rebuild hook for dracut based on dracut-hook AUR package"
url=https://wiki.archlinux.org/title/NVIDIA#pacman_hook
arch=('any')
license=('WTFPL')
depends=('dracut' 'dracut-hook')
conflicts=('dracut-uefi-hook' 'dracut-ukify')
source=("nvidia-dracut.hook")
sha256sums=('3540fa264a330a4a5f82a2c93f8643b1ba6c7205885802bad20b5ef94623510c')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}