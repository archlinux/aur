# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-stream
pkgver=1.1.3
pkgrel=1
pkgdesc="Ad-free Twitch streams and videos via streamlink and ttvlol plugin"
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('curl' 'streamlink')
optdepends=('chatterino: For opening chat'
            'ffmpeg: For conversion after download'
            'mpv: For watching content'
            'python-cloudscraper: Required for Kick plugin')
sha256sums=('a733cd80015820855072547737267943e15dc49dd6394e0aad2d672f04148b0b')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
