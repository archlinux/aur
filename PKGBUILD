# Maintainer: jdev082 <jdev0894@gmail.com>
pkgname=dmenu-wl-dmenu-dropin
pkgver=1.0
pkgrel=1
pkgdesc="Makes symlinks to provide dmenu when using dmenu-wayland."
arch=('any')
license=('none')
depends=('dmenu-wayland')
provides=(dmenu)
conflicts=(dmenu)


package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/"
    mkdir -p "$pkgdir/usr/share/man/man1"
    ln -sf "dmenu-wl" "$pkgdir/usr/bin/dmenu"
    ln -sf "dmenu-wl_run" "$pkgdir/usr/bin/dmenu_run"
    ln -sf "dmenu-wl_path" "$pkgdir/usr/bin/dmenu_path"
    ln -sf "dmenu-wl.1.gz" "$pkgdir/usr/share/man/man1/dmenu.1.gz"
}