pkgname=boot-to-windows
pkgver=1.0.2
pkgrel=1
pkgdesc="boot-to-windows command and .desktop shortcut. Do grub-reboot into Windows"
arch=('x86_64')
license=('unknown')
source=("boot-to-windows.desktop"
        "boot-to-windows.sh")
sha256sums=("SKIP"
            "SKIP")

package(){
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
