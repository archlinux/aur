pkgname="sk-boot-to-windows"
pkgver="1.0.2"
pkgrel=1
pkgdesc="Creates a .desktop application to boot into Windows"
arch=(any)
license=('MIT')
depends=('efibootmgr')
source=(
    'sk-boot-to-windows.sh' 
    'sk-boot-to-windows.desktop'
    'sk-boot-to-windows.svg')

sha256sums=(
    'SKIP'  
    'SKIP'
    'SKIP')

package() {
    # echo "Name[zh_CN]=启动到Windows" >> "$srcdir/systemd-boot-to-windows.desktop"

    install -Dm755 "$srcdir/sk-boot-to-windows.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/sk-boot-to-windows.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
    install -Dm644 "$srcdir/sk-boot-to-windows.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}