# Maintainer: lyj404
pkgname=bo-music
pkgver=0.0.6
pkgrel=1
pkgdesc='A modern Fluent-style music player'
arch=('x86_64')
url='https://github.com/lyj404/bo-music'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'libx11' 'fontconfig' 'vulkan-icd-loader' 'libsecret' 'mpv' 'dbus')
optdepends=('libpulse: parec command for audio spectrum visualization')
conflicts=('bo_music')
replaces=('bo_music')
options=('!strip' '!debug')
source_x86_64=('https://github.com/lyj404/bo-music/releases/download/v0.0.6/bo-music_0.0.6_linux_x64.tar.gz')
sha256sums_x86_64=('c9eeb03b1b2f3ae70724384f8f4376bff6cad6e687ae35eb1d56ff4fea8bfc3d')

package() {
    cd "$srcdir/bo-music_0.0.6_linux_x64"
    install -Dm755 bo-music "$pkgdir/usr/bin/bo-music"
    install -Dm644 bo_music.desktop "$pkgdir/usr/share/applications/bo_music.desktop"
    install -Dm644 bo_music.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/bo_music.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bo-music/LICENSE"
}
