# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=ventoy-iso-bin
pkgver=1.0.42
pkgrel=1
pkgdesc="A multiboot ISO image (Binary)"
arch=(any)
url="https://github.com/ventoy/Ventoy"
license=('GPL3')
provides=(ventoy-iso)
conflicts=(ventoy-iso)
source=("$url/releases/download/v$pkgver/ventoy-$pkgver-livecd.iso")
noextract=(ventoy-$pkgver-livecd.iso)
b2sums=('6f0640e9c0ee51bcc407990465ebd972555976a6aae223ba201bfb93f3bbc76b47d0e3e0f06402a1026a629cff4d24c780796d57ffd77c82cf2f6046d35eac4f')

package() {
    install -Dm644 -v ventoy-$pkgver-livecd.iso "$pkgdir"/usr/share/ventoy/livecd.iso
}
