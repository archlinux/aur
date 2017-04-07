# Maintainer: James W. Barnett <james at wbarnett dot us>

pkgname=grub-btrfs
pkgver=1.11
pkgrel=1
pkgdesc="Include btrfs snapshots in GRUB boot options"
arch=('any')
url="https://github.com/Antynea/grub-btrfs"
license=('GPL3')
depends=('btrfs-progs' 'grub')
conflicts=('grub-btrfs-git')
source=("https://github.com/Antynea/grub-btrfs/archive/v${pkgver}.tar.gz")
md5sums=('847bdcea497ff1be3c788f10ebf532af')

package() {
  cd $pkgname-$pkgver
  install -Dm 755 "41_snapshots-btrfs" "${pkgdir}/etc/grub.d/41_snapshots-btrfs"
  install -Dm 644 "localisation/fr/grub-btrfs-git.mo" "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/grub-btrfs-git.mo"
}
