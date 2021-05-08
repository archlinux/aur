# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=ventoy-iso-bin
pkgver=1.0.43
pkgrel=1
pkgdesc="A multiboot ISO image (Binary)"
arch=(any)
url="https://github.com/ventoy/Ventoy"
license=('GPL3')
provides=(ventoy-iso)
conflicts=(ventoy-iso)
source=("$url/releases/download/v$pkgver/ventoy-$pkgver-livecd.iso")
noextract=(ventoy-$pkgver-livecd.iso)
b2sums=('aeee7a08e6672421b06f09db1101fc4776757a51bcda35034b2c19c7432e3f09164768b3b86943e3724afbfd85cdd932e9a5ca3a5a201e32b7b2a1e51322c082')

package() {
    install -Dm644 -v ventoy-$pkgver-livecd.iso "$pkgdir"/usr/share/ventoy/livecd.iso
}
