pkgname=zfs-openrc
pkgver=20241023
pkgrel=1
pkgdesc="OpenRC zfs init script"
arch=( "any" )
url="https://gitlab.com/aur3675443/zfs-openrc.git"
license=( "GPLV3" )
groups=( "openrc-system" )
provides=( "init-zfs" )
depends=( "openrc" "zfs-utils" "zfs-utils-git" "zfs-dkms" "zfs-dkms-git" )
source=( "git+$url" )
noextract=()
md5sums=('SKIP')
package(){
    install -Dm755 "$srcdir/zfs-openrc/zfs-mount" "$pkgdir/etc/init.d/zfs-mount"
    install -Dm755 "$srcdir/zfs-openrc/zfs-import" "$pkgdir/etc/init.d/zfs-import"
    install -Dm755 "$srcdir/zfs-openrc/zfs-load-key" "$pkgdir/etc/init.d/zfs-load-key"
    install -Dm755 "$srcdir/zfs-openrc/zfs-share" "$pkgdir/etc/init.d/zfs-share"
    install -Dm755 "$srcdir/zfs-openrc/zfs-zed" "$pkgdir/etc/init.d/zfs-zed"
}
