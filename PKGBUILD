# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=ventoy-iso-bin
pkgver=1.0.40
pkgrel=1
pkgdesc="A multiboot ISO image (Binary)"
arch=(any)
url="https://github.com/ventoy/Ventoy"
license=('GPL3')
provides=(ventoy-iso)
conflicts=(ventoy-iso)
source=("$url/releases/download/v$pkgver/ventoy-$pkgver-livecd.iso")
noextract=(ventoy-$pkgver-livecd.iso)
b2sums=('6d448c373cfd5a72b03446cd7d139c2a4e1693430c76d4952ee3d6a711c68d897193a17f638479929b6d79599ca039386920ce9bd0055a37d48a38260ceddc2d')

package() {
    install -Dm644 -v ventoy-$pkgver-livecd.iso "$pkgdir"/usr/share/ventoy/livecd.iso
}
