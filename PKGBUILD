pkgname=nicelock
pkgver=1.0
pkgrel=1
pkgdesc="Nice looking lock screen based on i3lock"
arch=("any")
url="https://github.com/Kruhlmann/nicelock"
license=("GPL")
depends=("imagemagick" "xorg-xrandr" "i3lock" "coreutils" "grep")
optdepends=("libnotify: for desktop notifications" "dunst: for controlling dunst notifications")
source=("nicelock")
sha256sums=("00fac3ed209599ac1f74317a5f6261450c384be6423b35ac246945e45edf7c6c")

package() {
    install -Dm755 "${srcdir}/nicelock" "${pkgdir}/usr/bin/nicelock"
}
