# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-stream
pkgver=1.0.3
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
sha256sums=('ac2231b9ba797ef7438ea87f12e2205a1a3dc15cef4c76178aca9fb16a674f66')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
