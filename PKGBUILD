# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=aerion-bin
pkgver=0.3.2
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
sha256sums_x86_64=('f4c8820b03c6e82a5c78656e094212dd3429bab01ef4e0cb36f0e346d2371020')
sha256sums_aarch64=('c0ab850187d9827204547a1fff165913973d8fd29a6eb25d1c5e83fe45693577')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" aerion
    install -Dm644 -t "$pkgdir/usr/share/applications/" io.github.hkdb.Aerion.desktop
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" io.github.hkdb.Aerion.png
}
