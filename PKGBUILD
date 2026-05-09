# Maintainer: typechecks

pkgname=anitui-bin
pkgver=0.1.0
pkgrel=2
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
sha256sums_x86_64=('e58fb96587cf4adc9e621ea4b4e0c419ac79cf6573611fc63ac7e7d15c521356')
sha256sums_aarch64=('16b09c6d71c56ac94ef6c2a8b388de37fc4daa9e4e623a13c212bed27e94cb8b')

package() {
    install -Dm755 "$srcdir/anitui" "$pkgdir/usr/bin/anitui"
}
