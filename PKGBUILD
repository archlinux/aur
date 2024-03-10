# Maintainer: Tarball <contact@trblwlf.net>
pkgname=nvidia-dracut-hook
pkgver=1
pkgrel=2
pkgdesc="nvidia initramfs rebuild hook for dracut based on dracut-hook AUR package"
url=https://wiki.archlinux.org/title/NVIDIA#pacman_hook
arch=('any')
license=('WTFPL')
depends=('dracut' 'dracut-hook' 'nvidia-dkms')
conflicts=('dracut-uefi-hook' 'dracut-ukify')
source=("nvidia-dracut.hook")
sha256sums=('8f8f461c441101444e034d64ea31dbd16b0a1824e44318202c791ec4a28d9886')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}