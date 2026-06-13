pkgname=swaypaper
pkgver=2.4.3
pkgrel=1
pkgdesc="Simple TUI wallpaper selector for swaybg"
arch=('any')
url="https://github.com/Kibblix/swaypaper"
license=('MIT')

depends=('bash' 'swaybg')

source=("swaypaper")

sha256sums=('SKIP')

package() {
    install -Dm755 swaypaper "$pkgdir/usr/bin/swaypaper"
}
