pkgname=netradio
pkgver=1.9
pkgrel=1
pkgdesc="YouTube ve internet radyolarını oynatan ve indiren Python tabanlı bir uygulama"
arch=('any')
url="https://github.com/saydut/netradio"
license=('GPL3')
depends=('mpv' 'yt-dlp' 'python' 'youtube-search-python' 'python-textual' 'python-httpx')
optdepends=('mpv-mpris: sistem medya tuşları ve KDE/GNOME ses paneli entegrasyonu')
makedepends=('git')
source=("git+https://github.com/saydut/netradio.git#branch=master")
md5sums=('SKIP')

package() {
    cd "$srcdir/netradio"
    install -Dm755 "netradio.py" "$pkgdir/usr/bin/netradio"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
