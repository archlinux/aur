# Maintainer: lyj404
pkgname=bo_music-bin
pkgver=0.0.1
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
source_x86_64=('https://github.com/lyj404/bo_music/releases/download/v0.0.1/bo_music_0.0.1_linux_x64.tar.gz')
sha256sums_x86_64=('72b71fd2fc87078710afd67ee0a2e8250c9d7566bad7303be844694b89cfc720')

package() {
    cd "$srcdir/bo_music_0.0.1_linux_x64"
    install -Dm755 bo_music "$pkgdir/usr/bin/bo_music"
    install -Dm644 bo_music.desktop "$pkgdir/usr/share/applications/bo_music.desktop"
    install -Dm644 bo_music.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/bo_music.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bo_music/LICENSE"
}
