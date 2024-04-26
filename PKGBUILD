# Maintainer: Tarball <contact@trblwlf.net>
pkgname=nvidia-dracut-hook
pkgver=3
pkgrel=1
pkgdesc="NVIDIA initramfs rebuild hook for dracut based on dracut-hook AUR package"
url=https://wiki.archlinux.org/title/NVIDIA#pacman_hook
arch=('any')
license=('WTFPL')
depends=('dracut' 'dracut-hook')
optdepends=('nvidia-dkms' 'nvidia-open-dkms')
conflicts=('dracut-uefi-hook' 'dracut-ukify')
source=("nvidia-dracut.hook")
sha256sums=('7792dbed0f33f1266d089342074028c73501fca6d1ebb972efefd9ef9b39bee1')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}