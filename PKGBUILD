# Maintainer: lyj404
pkgname=bo_music-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='A modern Fluent-style music player'
arch=('x86_64')
url='https://github.com/lyj404/bo_music'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'libx11' 'fontconfig' 'vulkan-icd-loader' 'libsecret' 'mpv' 'dbus')
optdepends=('libpulse: parec command for audio spectrum visualization')
provides=('bo_music')
conflicts=('bo_music')
options=('!strip' '!debug')
source_x86_64=('https://github.com/lyj404/bo_music/releases/download/v0.0.2/bo_music_0.0.2_linux_x64.tar.gz')
sha256sums_x86_64=('a33435ab6ea9952f2ecaaabefd28ece3cd6de04181c8ad0a1a61996ba2bed1fc')

package() {
    cd "$srcdir/bo_music_0.0.2_linux_x64"
    install -Dm755 bo_music "$pkgdir/usr/bin/bo_music"
    install -Dm644 bo_music.desktop "$pkgdir/usr/share/applications/bo_music.desktop"
    install -Dm644 bo_music.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/bo_music.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bo_music/LICENSE"
}
