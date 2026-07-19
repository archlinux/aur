# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsh-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/discord-dynamic-status-hyprland"
license=('MIT')
depends=('glibc')
provides=('ddsh')
conflicts=('ddsh' 'ddsh-git')
source=("$url/releases/download/v$pkgver/ddsh"
        "$url/raw/v$pkgver/LICENSE")
b2sums=('SKIP'
        'SKIP')

package() {
    install -Dm755 "$srcdir/ddsh" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
