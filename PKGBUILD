pkgname=hyprdots-ctl
pkgver=0.5
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations"
arch=('x86_64')
url="https://github.com/kRHYME7/KhingDom" # replace with your repository URL
license=('unknown') # replace with your script's license
depends=('hyprland-git' 'hyprland')
source=("https://raw.githubusercontent.com/kRHYME7/KhingDom/Addition-Hyprdots-CLI-WIP%5D/Scripts/Hyprdots")
md5sums=('a231c7dc2ac62c1436a2f4ceb840e4ff')
noextract=()

pkgver() {
  cd "$srcdir/Hyprdots"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    # The $pkgdir variable points to the package directory where files will be installed
    # Install the script to /usr/bin so it's available system-wide
    install -Dm755 "$srcdir/Hyprdots" "$pkgdir/usr/bin/Hyprdots"
}
