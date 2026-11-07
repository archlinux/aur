# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-audio-player-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell music player'
depends=('synshell-core' 'ffmpeg')
provides=('syn-audio-player')
conflicts=('syn-audio-player' 'syn-audio-player-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-audio-player-0.2.0-x86_64.tar.zst' 'syn-audio-player-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-audio-player-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-audio-player-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('f9c97eb696ff483e10594d2af67b9c884cf5bab4268eb5936138999c8586c0ef')
source_aarch64=("syn-audio-player-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-audio-player-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('b7ddaa6ddb3e68fa66134fb76a34d4f9fd88c38fb0c66bf10e9880403407a540')

package() {
    bsdtar -xpf "$srcdir/syn-audio-player-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
