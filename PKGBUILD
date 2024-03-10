# Maintainer: Tarball <contact@trblwlf.net>
pkgname=nvidia-dracut-hook
pkgver=2
pkgrel=1
pkgdesc="NVIDIA initramfs rebuild hook for dracut based on dracut-hook AUR package"
url=https://wiki.archlinux.org/title/NVIDIA#pacman_hook
arch=('any')
license=('WTFPL')
depends=('dracut' 'dracut-hook' 'nvidia-dkms')
conflicts=('dracut-uefi-hook' 'dracut-ukify')
source=("nvidia-dracut.hook")
sha256sums=('8b271a7d0c9213877368cc42a821234dd1d0640c11c834f1e83816ba3be105cd')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}