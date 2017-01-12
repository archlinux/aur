pkgname=gpgunlock
pkgver=discontinued
pkgrel=9
pkgdesc="prefer https://aur.archlinux.org/packages/keyencrypt"
arch=(any)
depends=(mkinitcpio cryptsetup gnupg)
source=(hook hook_install rootkey.sh)
md5sums=(SKIP SKIP SKIP)
isntall=install

package() {
    cd "$srcdir"
	install -Dm644 hook "$pkgdir"/usr/lib/initcpio/hooks/gpgunlock
	install -Dm644 hook_install "$pkgdir"/usr/lib/initcpio/install/gpgunlock
    
    install -Dm755 rootkey.sh "$pkgdir"/usr/bin/setbootpassword
}
