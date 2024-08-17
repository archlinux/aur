pkgname=netradio
pkgver=1.6
pkgrel=1
pkgdesc="YouTube ve internet radyolarını oynatan ve indiren Python tabanlı bir uygulama"
arch=('x86_64')
url="https://gitlab.com/saydut/netradio"
license=('GPL3')
depends=('mpv' 'yt-dlp' 'python' 'youtube-search-python')
makedepends=('git')
source=("git+https://gitlab.com/saydut/netradio.git#branch=master")
md5sums=('SKIP')

package() {
    cd "$srcdir/netradio" # Eğer GitLab'daki repo bir alt dizinde
    install -Dm755 "netradio.py" "$pkgdir/usr/bin/netradio"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
