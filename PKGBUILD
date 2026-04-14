# Maintainer: tutkuofnight <https://github.com/tutkuofnight>
pkgname=lycan-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightweight PWA manager for Linux desktops"
arch=('x86_64')
url="https://github.com/tutkuofnight/lycan"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'glib2')
provides=('lycan')
conflicts=('lycan' 'lycan-git')
source=("https://github.com/tutkuofnight/lycan/releases/download/v${pkgver}/lycan-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('c2260d41035f0458392e525de1f0ae06d8a4ee726fe7569a1b99e737269d1487')

package() {
    install -Dm755 "lycan" "$pkgdir/usr/bin/lycan"
}
