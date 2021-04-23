# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=ventoy-iso-bin
pkgver=1.0.41
pkgrel=1
pkgdesc="A multiboot ISO image (Binary)"
arch=(any)
url="https://github.com/ventoy/Ventoy"
license=('GPL3')
provides=(ventoy-iso)
conflicts=(ventoy-iso)
source=("$url/releases/download/v$pkgver/ventoy-$pkgver-livecd.iso")
noextract=(ventoy-$pkgver-livecd.iso)
b2sums=('f5f1a74011ed69967df4dda1a39229c8257a6c823750bcb3af2bf4ade595fabc21d64d90e458eaee65a237a09eecbecb4796f6df90b759af48fec8a80a96bb1d')

package() {
    install -Dm644 -v ventoy-$pkgver-livecd.iso "$pkgdir"/usr/share/ventoy/livecd.iso
}
