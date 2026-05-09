# Maintainer: typechecks

pkgname=anitui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='a tui for browsing and streaming anime (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/typechecks/anitui'
license=('GPL-3.0-only')
optdepends=(
    'mpv: media player for streaming'
    'vlc: media player for streaming'
    'haruna: media player for streaming'
)
provides=('anitui')
conflicts=('anitui')

source_x86_64=("$pkgname-$pkgver-linux-amd64.tar.gz::https://github.com/typechecks/anitui/releases/download/v$pkgver/anitui_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.gz::https://github.com/typechecks/anitui/releases/download/v$pkgver/anitui_linux_arm64.tar.gz")
sha256sums_x86_64=('4d4767c45a0e01aad3d7323da4f345dd72b05700ec7b16a2562363799d0156d7')
sha256sums_aarch64=('3ab47b2fecedd194da0fea6f48338ed8dcb568bb1d670345299015991e6676d5')

package() {
    install -Dm755 "$srcdir/anitui" "$pkgdir/usr/bin/anitui"
}
