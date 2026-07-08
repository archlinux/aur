# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=aerion-bin
pkgver=0.3.1
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
sha256sums_x86_64=('4de5f673b256a683790d263c4adb85beed1601c711d0368ff2d4633707e933a1')
sha256sums_aarch64=('cecd8d17295a77cf65d41278f692a1325ff27f0c46e3f639167c0f5fb576c749')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" aerion
    install -Dm644 -t "$pkgdir/usr/share/applications/" io.github.hkdb.Aerion.desktop
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" io.github.hkdb.Aerion.png
}
