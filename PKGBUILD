# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-stream
pkgver=1.1.1
pkgrel=2
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
sha256sums=('d4dcbc5603861bb57ed3246ac9269d91e17ae3b81007d15e7d463b380dab4f0f')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
