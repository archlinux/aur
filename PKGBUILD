# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname=beat-saber-mod-manager-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Yet another mod installer for Beat Saber, heavily inspired by ModAssistant. "
arch=('x86_64')
url="https://github.com/affederaffe/BeatSaberModManager"
license=('MIT')
source=("https://github.com/affederaffe/BeatSaberModManager/releases/download/v$pkgver/BeatSaberModManager-linux-x64.zip"
        "BeatSaberModManager.desktop"
        "beat-saber-mod-manager.png")
md5sums=('fa2b2f25a4c909d3399e3ba2ae2e9d6d'
        'SKIP'
        'SKIP')
options=(!strip)

package() {
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/applications"

        install -Dm755 "$srcdir/BeatSaberModManager" "$pkgdir/usr/bin/"
        install -Dm644 "$srcdir/BeatSaberModManager.desktop" "$pkgdir/usr/share/applications/"
        install -Dm644 "$srcdir/beat-saber-mod-manager.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/beat-saber-mod-manager.png"
}
