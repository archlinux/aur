# Maintainer: starquake starquake@linuxeverywhere.org
# Contributor: dtluna dtluna@waifu.club
pkgname=pacman-backup-hook
pkgver="1.0.1"
pkgrel=2
pkgdesc="A pacman hook that will save the list of your packages to /etc/pkglist.txt on every install and removal"
arch=('any')
license=('custom:Unlicense')
depends=(
    'pacman>=5.1'
)
source=(
    'pacman-backup.hook'
    'LICENSE'
)
sha256sums=(
    'e05db077598b8cd441dfbb878a3f8886a07c69068bf481a06574c50c250a6055'
    '624b4fa9589a9ac0db3a8f91c50ad8c111765bae56829cd105fd8fb72b905c28'
)

package() {
  install -Dm0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
  install -Dm0644 $srcdir/pacman-backup.hook $pkgdir/usr/share/libalpm/hooks/pacman-backup.hook
}
