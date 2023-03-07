pkgname=dotsync
pkgver=0.0.1
pkgrel=0
pkgdesc="Command line utility to manage dotfiles"
arch=('x86_64' 'i686')
url="https://github.com/termapps/dotsync"
license=("MIT")
provides=("dotsync")
source_x86_64=(dotsync-0.0.1.zip::https://github.com/termapps/dotsync/releases/download/v0.0.1/dotsync-v0.0.1-x86_64-unknown-linux-gnu.zip)
source_i686=(dotsync-0.0.1.zip::https://github.com/termapps/dotsync/releases/download/v0.0.1/dotsync-v0.0.1-i686-unknown-linux-gnu.zip)
sha256sums_x86_64=("10719af894ed57bc0b6145c01bd47a3c97c61d496f6c8d3dd60264e1821e39b4")
sha256sums_i686=("0d5446d5d0147f1542b203759b055c9d56cbf996dab0dd3c833ffae43cb034ec")

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
