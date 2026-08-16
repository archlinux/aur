pkgname=cli-music-player-lrc
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal music player with LRC suport"
arch=('any')
url="https://github.com/FlippantList428/CLI-Music-Player-with-LRC"
license=('MIT')

depends=('python' 'mpv' 'python-mutagen' 'python-pillow' 'python-mpv')

source=("git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/CLI-Music-Player-with-LRC"

    install -Dm755 cli_player.py "$pkgdir/usr/bin/cli-player"
}