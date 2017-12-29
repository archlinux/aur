pkgname=snap-pac-grub
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots"
arch=('any')
license=('MIT')
depends=('snap-pac' 'grub-btrfs')
source=("zz_snap-pac-grub-post.hook"
        "zz_snap-pac-grub-post.hook.sig"
        "PKGBUILD.sig")
sha512sums=('7d0fb82026f86ce4f932011cb569e82f5a957a7f39f89bb1adbb8ff7aa5ba1b91ce9be9ff4d246722c60a6b1cc896b34cb3c6c779f36da86bee5ad8d39754485'
            'SKIP'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
  install -Dm644 zz_snap-pac-grub-post.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}
