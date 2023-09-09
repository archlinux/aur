# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-stream
pkgver=1.2.0
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
sha256sums=('bc6f1050b1c3c1f0c552371d9fb50695e42474bf1613dfeffb3bd7e33c882c9e')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
