# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-stream
pkgver=1.1.2
pkgrel=1
pkgdesc="Ad-free Twitch streams and videos via streamlink and ttvlol plugin"
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('curl' 'streamlink')
optdepends=('chatterino: For opening chat'
            'ffmpeg: For conversion after download'
            'jq: For parsing api responses'
            'mpv: For watching content'
            'python-cloudscraper: Required for Kick plugin')
sha256sums=('b31cbc88265de8b7e5f39219f7a1b472670547ab68ae9cd6a34a1618eddbbc53')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
