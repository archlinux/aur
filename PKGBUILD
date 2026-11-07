# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-video-player-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell video player: hardware decoding, subtitles, neural upscaling and frame interpolation'
depends=('synshell-core' 'ffmpeg')
provides=('syn-video-player')
conflicts=('syn-video-player' 'syn-video-player-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-video-player-0.2.0-x86_64.tar.zst' 'syn-video-player-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-video-player-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-video-player-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('e4dcab3a3bf4d680615a311fe0442de685abf3d3f32db85b198f71353b077800')
source_aarch64=("syn-video-player-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-video-player-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('8b5fdad1371015f85c0dceadde1486db74b805d74f079ec185a128c2811d9225')

package() {
    bsdtar -xpf "$srcdir/syn-video-player-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
