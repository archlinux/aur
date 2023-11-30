pkgname=hyprdots-ctl
pkgver=0.5019
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations"
arch=('x86_64')
url="https://github.com/prasanthrangan/hyprdots" 
license=('unknown') # replace with your script's license
depends=('hyprland-git' 'hyprland')
source=("https://raw.githubusercontent.com/kRHYME7/KhingDom/59f3ad8f3a04794454dd49e4748477f86440fa2d/Scripts/Hyprdots")
md5sums=('a231c7dc2ac62c1436a2f4ceb840e4ff')
noextract=()

package() {
    # The $pkgdir variable points to the package directory where files will be installed
    # Install the script to /usr/bin so it's available system-wide
    install -Dm755 "$srcdir/Hyprdots" "$pkgdir/usr/bin/Hyprdots"
}
