pkgname=hyprdots-ctl
pkgver=$(cd ~/Hyprdots ; git describe --tags)
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations"
arch=('x86_64')
url="https://github.com/kRHYME7/KhingDom"
license=('unknown')
depends=('hyprland-git' 'hyprland')
source=("https://raw.githubusercontent.com/kRHYME7/KhingDom/Addition-Hyprdots-CLI-WIP%5D/Scripts/Hyprdots")
md5sums=('a231c7dc2ac62c1436a2f4ceb840e4ff')
noextract=()

package() {
   install -Dm755 "$srcdir/Hyprdots" "$pkgdir/$HOME/.local/bin/Hyprdots"
}
