# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=systemd-battery-targets-git
pkgver=0.1.1
depends=('systemd')
pkgrel=0
arch=(any)
pkgdesc="Systemd targets for battery and ac"
url="https://chrisdown.name/2017/10/29/adding-power-related-targets-to-systemd.html"
license=("custom")
options=(!strip)

source=("https://github.com/lucasew/arch-systemd-battery-targets/archive/v$pkgver.zip")
sha256sums=("ffb068da30bbc8a5618aae39cc690822764f9f0079aa0d083831a54615e17ae8")

package() {
    cp $srcdir/arch-systemd-battery-targets-$pkgver/target/* $pkgdir -r
    chmod 644 $pkgdir/usr/lib/udev/rules.d/99-powertargets.rules
}
