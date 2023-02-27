# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=rk2023-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Estonian Parliamentary elections 2023 Internet Voting application"
arch=('x86_64')
url="https://www.valimised.ee/en"
license=('custom')
depends=()
source=('https://www.valimised.ee/valijarakendus/RK_2023_linux.bin'
	'rk2023.png'
	'rk2023.desktop')
sha256sums=('ff5b2ff785725ba60308562031ec5270a41846c4e92d7bbd2a3cdad2a2800215'
            '034c7c8c15a9dbdbef70a26c78b0daac06dc59feee25b17aff47a00cd5e36fd3'
            'd3fa00b7411bd4a6e90f46cd5a40306779a437a1825a9406ac2bb458ab20e54b')

package() {
  install -D -T -m 644 "$srcdir/rk2023.desktop" "$pkgdir/usr/share/applications/rk2023.desktop"
  install -D -T -m 644 "$srcdir/rk2023.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/rk2023.png"
  install -D -T -m 755 "$srcdir/RK_2023_linux.bin" "$pkgdir/usr/bin/rk2023"
}
# vim:syntax=sh
