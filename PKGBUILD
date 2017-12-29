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
sha512sums=('bb0f393f7f8314db34f9b5b6de5f34c488518453853dc239bd41402805ec548d687cf7d1bf19c5b42e4d173a9d61581f76aff05d2fce3fd75930a662f9672197'
            'SKIP'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
  cd "$pkgname"
  install -Dm644 zz_snap-pac-grub-post.hook "$pkgdir/usr/share/libalpm/hooks/"
}
