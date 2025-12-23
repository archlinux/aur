pkgname=onetube-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="OneTube - prosty downloader GUI (PyQt6 + yt-dlp)"
arch=('any')
url="https://github.com/OneDevelopmentPL/onetube-gui"
license=('MIT')

depends=('python' 'python-pyqt6' 'yt-dlp' 'ffmpeg')

source=("main.py"
        "onetube"
        "onetube.desktop")
sha256sums=('SKIP' 'SKIP' 'SKIP')  # lokalne pliki, AUR nie sprawdza

package() {
    # pliki do /usr/share/onetube
    install -Dm644 main.py "$pkgdir/usr/share/onetube/main.py"
    install -Dm755 onetube "$pkgdir/usr/bin/onetube"
    install -Dm644 onetube.desktop "$pkgdir/usr/share/applications/onetube.desktop"
}

