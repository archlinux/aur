# Maintainer: Raj Jagadeesh A P <rajjagadeesh2006@gmail.com>
pkgname=hypr-game-mode
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI Gaming Dashboard for Hyprland: Scrcpy, Game Launcher, & Hardware Optimizer"
arch=('any')
url="https://github.com/Raj-Jagadeesh-A-P/hypr-game-mode"
license=('GPL3')
depends=('bash' 'hyprland' 'fzf' 'scrcpy' 'android-tools' 'libnotify' 'mangohud' 'gamemode')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 hypr-game-mode "$pkgdir/usr/bin/hypr-game-mode"
    # Create config dir for user (optional, usually handled by script)
}
