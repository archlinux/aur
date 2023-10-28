# Maintainer: Cyanism <aur at cyan dot slmail dot me>
pkgname=ruso-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform CLI and GUI application to easily modify osu! beatmap parameters."
arch=("x86_64")
url="https://github.com/Cyanistic/ruso"
license=('GPL-3.0')
conflicts=('ruso')
provides=('ruso')
depends=('glibc' 'webkit2gtk-4.1')
optdepends=('gosumemory: auto selection of osu! map')
source=("ruso-linux-${pkgver}::https://github.com/Cyanistic/ruso/releases/download/v${pkgver}/ruso-x86_64-unknown-linux-gnu")
md5sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 ruso-linux-${pkgver} "$pkgdir/usr/bin/ruso"
}
