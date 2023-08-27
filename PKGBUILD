# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-stream
pkgver=1.0.4
pkgrel=1
pkgdesc="Ad-free Twitch streams and videos via streamlink and ttvlol plugin"
arch=('any')
url="https://codeberg.org/codeberge/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('curl' 'streamlink')
optdepends=('chatterino: For opening chat'
            'ffmpeg: For conversion after download'
            'jq: For parsing api responses'
            'mpv: For watching content')
sha256sums=('5a9b8c05957c923a89dc9bc26fb4bd49c3b7de09000bc7d05f4331ca834ce5ef')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
