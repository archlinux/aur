# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=aerion-bin
pkgver=0.3.3
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
sha256sums_x86_64=('7600ea8060dc1f07ad7eaf593dcb4c7e84f5db20d00fb43d5063cb217724d947')
sha256sums_aarch64=('b1de0dc69ec6cf0bd770aeedfb67ee4007f1969c91e436da10e504b4cc3a45de')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" aerion
    install -Dm644 -t "$pkgdir/usr/share/applications/" io.github.hkdb.Aerion.desktop
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" io.github.hkdb.Aerion.png
}
