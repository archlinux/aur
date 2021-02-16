# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=pacman-mirrorlist-cn-git
pkgver=20210216
pkgrel=1
pkgdesc="Arch Linux China Mainland mirror list for use by pacman"
arch=('x86_64')
url="https://github.com/zhullyb/pacman-mirrorlist-cn"
conflicts=('pacman-mirrorlist')
provides=('pacman-mirrorlist')
license=('custom')
backup=(etc/pacman.d/mirrorlist)
source=("git+https://github.com/zhullyb/pacman-mirrorlist-cn.git")
md5sums=('SKIP')

package() {
    mkdir -p "$pkgdir/etc/pacman.d"
    install -m644 "$srcdir/pacman-mirrorlist-cn/mirrorlist" "$pkgdir/etc/pacman.d/"
}
