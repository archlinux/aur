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
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    install -Dm755 "lycan" "$pkgdir/usr/bin/lycan"
}
