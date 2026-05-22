# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=aerion-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="An Open Source Lightweight E-Mail Client"
arch=('x86_64' 'aarch64')
url="https://aerion.3df.io"
license=('Apache-2.0')
depends=('at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'zlib')
provides=('aerion')
conflicts=('aerion')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/hkdb/aerion/releases/download/v$pkgver/aerion-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/hkdb/aerion/releases/download/v$pkgver/aerion-linux-arm64.tar.gz")
sha256sums_x86_64=('5ee1f0175ac6bdff42a1747715d3fd72dc0d2b01ede83898ee7b8864405914e9')
sha256sums_aarch64=('4d31935f9e2f9139a85c68976695825e6ddfe7a569f39600d2f846ea8839d76e')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" aerion
    install -Dm644 -t "$pkgdir/usr/share/applications/" io.github.hkdb.Aerion.desktop
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" io.github.hkdb.Aerion.png
}
