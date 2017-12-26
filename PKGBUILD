# Maintainer: Xiang Gao <qasdfgtyuiop at gmail dot com>
pkgname=mkinitcpio-docker-hooks
pkgver=1.0
pkgrel=1
pkgdesc="mkinitcpio hooks that provides support for using docker image as root"
arch=(any)
url="https://github.com/zasdfgbnm/mkinitcpio-docker-hooks"
license=('GPL')
groups=('base')
depends=('mkinitcpio' 'jq')
backup=(etc/docker-btrfs.sh)
source=('install_docker-btrfs' 'hooks_docker-btrfs' 'etc_docker-btrfs.sh')
md5sums=('0da33ef9ff132737a09173fdd45cddd6'
         'e1d51dd467412b48361c648226e6b57e'
         'a1243d4a874f69ef696f5c6ac58424cb')

package() {
    install -Dm644 install_docker-btrfs "${pkgdir}/usr/lib/initcpio/install/docker-btrfs"
    install -Dm644 hooks_docker-btrfs "${pkgdir}/usr/lib/initcpio/hooks/docker-btrfs"
    install -Dm644 etc_docker-btrfs.sh "${pkgdir}/etc/docker-btrfs.sh"
}
