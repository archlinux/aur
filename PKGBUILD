# Maintainer: Henrik Bernhardt <57109108+Henriklmao@users.noreply.github.com>
pkgname=headset-tui-bin
pkgver=0.2.0_2
pkgrel=1
pkgdesc='Waybar integration for HeadsetControl with an interactive TUI (pre-built binary)'
arch=('x86_64')
url='https://github.com/Henriklmao/headset-tui'
license=('GPL3')
depends=('headsetcontrol')
provides=('headset-tui')
conflicts=('headset-tui' 'headset-tui-git')
source=("$pkgname-$pkgver::https://github.com/Henriklmao/headset-tui/releases/download/v0.2.0-2/headset-tui-v0.2.0-2-x86_64-linux-gnu")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/headset-tui"
}
