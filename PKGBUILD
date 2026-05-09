
# Maintainer: xPsycho999 https://github.com/xPsycho999
pkgname=lofi-atc-mixer
pkgver=1.0
pkgrel=1
pkgdesc="Terminal TUI for Lofi, Live-ATC & Ambient Sounds with Cava visualizer"
arch=('any')
url="https://github.com/xPsycho999/lofi-atc-mixer"
license=('GPL3')
depends=('mpv' 'yt-dlp' 'fzf' 'socat' 'cava')
# Wir nutzen den Link zu deinem v1.0 Release
source=("$pkgname-$pkgver.tar.gz::https://github.com/xPsycho999/lofi-atc-mixer/archive/refs/tags/v1.0.tar.gz")
sha256sums=('0ab2debe69394a89938788cd5c93f2af3ffc310b94037fb823fcf4997ff52403')

package() {
    # Wir gehen in den entpackten Ordner (GitHub hängt den Repo-Namen an)
    cd "$srcdir/lofi-atc-mixer-1.0"
    
    # Das Skript wird nach /usr/bin/ kopiert und in 'lofi-atc' umbenannt
    # So kannst du es später einfach mit 'lofi-atc' im Terminal starten
    install -Dm755 lofi-atc-mixer.sh "$pkgdir/usr/bin/lofi-atc-mixer"
}
