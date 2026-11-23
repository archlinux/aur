pkgname=orangplayer-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Media player for your files, YouTube, YT Music, SoundCloud and Spotify, with lyrics, downloads and skins"
arch=('x86_64')
url="https://github.com/Orang-Studio/OrangPlayer"
license=('GPL-3.0-or-later')
# only stable sonames, libmpv comes from mpv so ffmpeg or libplacebo updates cant break it
depends=('qt6-base>=6.12' 'qt6-declarative>=6.12' 'qt6-svg>=6.12' 'qt6-websockets>=6.12' 'mpv' 'taglib' 'libpulse'
         'libglvnd' 'openssl' 'gcc-libs' 'glibc' 'ffmpeg' 'yt-dlp' 'hicolor-icon-theme')
optdepends=('noto-fonts-cjk: Chinese, Japanese and Korean lyrics and titles'
            'cava: visualizer bars'
            'discord: Rich Presence'
            'python-ytmusicapi: YouTube Music account')
provides=('orangplayer')
conflicts=('orangplayer' 'orang-player')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/orangplayer-$pkgver-x86_64.tar.zst")
sha256sums=('a7198fb9a16425ddf7e9b725e76470c84ee26a82de7e6e493060bd275bebf625')

package() {
    cp -a usr "$pkgdir/"
}
