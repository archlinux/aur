# Maintainer: Dave Shoreman <aur+nextshot at dsdev dot io>
pkgname=nextshot
pkgver=0.8.2
pkgrel=2
pkgdesc="A simple screenshot tool that uploads to Nextcloud and works with Sway and X11"
arch=('x86_64')
url="https://github.com/dshoreman/nextshot"
license=('GPL')
depends=('bash' 'curl')
optdepends=(
    "yad: tray icon and gui support"
    "grim: take screenshots on Sway"
    "jq: window selection on Sway"
    "slurp: area selection on Sway"
    "wl-clipboard: clipboard support on Sway"
    "imagemagick: take screenshots on X11"
    "slop: window/area selection on X11"
    "xclip: clipboard support on X11"
)
source=(https://github.com/dshoreman/nextshot/archive/v0.8.2.tar.gz)
md5sums=('b4b1ab471694b251d38fd2a3a7a459be')


package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin"
    cp -p nextshot.sh "$pkgdir/usr/bin/nextshot"
}
