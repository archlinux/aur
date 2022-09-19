# Maintainer: ItzSelenux <itszariep@outlook.com>

pkgname="ghostlexly-gpu-video-wallpaper"
_reponame='gpu-video-wallpaper'
pkgver=2021.11.26.r9.g8773e95
pkgrel=1
arch=("any")
pkgdesc="An x-cursor theme inspired by Graphite gtk theme."
url="https://github.com/ghostlexly/${_reponame}"
license=("MIT")
depends=('python-pyqt5' 'mpv' 'xorg-xrandr' 'xwinwrap')
makedepends=("git")
source=("git+$url.git")
sha256sums=('SKIP')

package()
{
cd gpu-video-wallpaper
install -Dm755 "gui.ui" -t "$pkgdir/usr/bin/"
install -Dm755 "video-wallpaper.py" -t "$pkgdir/usr/bin/"
install -Dm755 "gui.ui" -t "$pkgdir/usr/bin/"
install -Dm755 "video-wallpaper.sh" -t "$pkgdir/usr/bin/"
}

