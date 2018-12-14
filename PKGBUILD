# Maintainer: dtluna dtluna@waifu.club
pkgname=pacman-backup-hook
pkgver="1.0.0"
pkgrel=2
pkgdesc="A pacman hook that will save the list of your packages to /etc/pkglist.txt on every install and removal"
arch=('any')
url="https://git.voluntaryism.club/dtluna/pacman-backup-hook"
license=('unknown')
depends=(
    'pacman>=5.1'
)
source=(
    'pacman-backup.hook'
    'LICENSE'
)
sha256sums=(
    'e05db077598b8cd441dfbb878a3f8886a07c69068bf481a06574c50c250a6055'
    'faf2caea6f44f13dc7d138c1e6106bce82b0c416260dc4a8538f7b2d7f6a033c'
)

package() {
  install -Dm0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
  install -Dm0644 $srcdir/pacman-backup.hook $pkgdir/usr/share/libalpm/hooks/pacman-backup.hook
}
