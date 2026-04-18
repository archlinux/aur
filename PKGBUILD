# Maintainer: tutkuofnight <https://github.com/tutkuofnight>
pkgname=lycan-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightweight PWA manager for Linux desktops"
arch=('x86_64')
url="https://github.com/tutkuofnight/lycan"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2')
provides=('lycan')
conflicts=('lycan' 'lycan-git')
source=("https://github.com/tutkuofnight/lycan/releases/download/v${pkgver}/lycan-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('57cbf369044d2046cb49c5092f24e555ad77f667de637c84e60bdf454724b743')

package() {
    install -Dm755 "lycan" "$pkgdir/usr/bin/lycan"
    install -Dm644 "io.github.tutkuofnight.Lycan.desktop" "$pkgdir/usr/share/applications/io.github.tutkuofnight.Lycan.desktop"
    install -Dm644 "io.github.tutkuofnight.Lycan.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.tutkuofnight.Lycan.metainfo.xml"
    install -Dm644 "io.github.tutkuofnight.Lycan.png" "$pkgdir/usr/share/pixmaps/io.github.tutkuofnight.Lycan.png"
}
