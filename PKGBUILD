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
sha256sums_x86_64=('aad69f646846c993f603117b291dbca1aca1406b0dfe44b5dee81da7656fe3be')
sha256sums_aarch64=('a86c9c71d98153dc4e2ca04be4000a1131feb7f865eff1da1d94d7cb57da879b')

package() {
    install -Dm755 "$srcdir/anitui" "$pkgdir/usr/bin/anitui"
}
