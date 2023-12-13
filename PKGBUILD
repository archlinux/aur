# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-stream
pkgver=1.2.1
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
sha256sums=('05cc3c0728c409263ec31058207c01270dbcc378150622ceff086149337e9d80')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
