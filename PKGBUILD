pkgname=orangplayer-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Media player for your files, YouTube, YT Music, SoundCloud and Spotify, with lyrics, downloads and skins"
arch=('x86_64')
url="https://github.com/Orang-Studio/OrangPlayer"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'taglib' 'ffmpeg' 'yt-dlp' 'libplacebo' 'libass' 'luajit' 'lcms2'
         'uchardet' 'zimg' 'libpulse' 'libpipewire' 'alsa-lib' 'sndio' 'libva' 'libvdpau' 'libdrm' 'libdisplay-info'
         'mesa' 'libglvnd' 'vulkan-icd-loader' 'wayland' 'libxkbcommon' 'libx11' 'libxext' 'libxfixes' 'libxpresent'
         'libxrandr' 'libxss' 'libxv' 'libjpeg-turbo' 'zlib' 'openssl' 'hicolor-icon-theme')
optdepends=('noto-fonts-cjk: Chinese, Japanese and Korean lyrics and titles'
            'cava: visualizer bars'
            'discord: Rich Presence')
provides=('orangplayer')
conflicts=('orangplayer' 'orang-player')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/orangplayer-$pkgver-x86_64.tar.zst")
sha256sums=('d914a37106073ebdb7767072bbae098a038ce9410c15acccf599891aca93cddf')

package() {
    cp -a usr "$pkgdir/"
}
