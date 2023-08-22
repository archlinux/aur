# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-stream
pkgver=1.0.0
pkgrel=1
pkgdesc="Ad-free Twitch streams and videos via streamlink and ttvlol plugin"
arch=('any')
url="https://codeberg.org/codeberge/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('curl' 'streamlink')
optdepends=('chatterino: For opening chat'
            'ffmpeg: For conversion after download'
            'mpv: For watching content')
sha256sums=('912e169a0f80239b5dca4cb49645ae0d45dd48f6ad20dd7c1722b8d80fc01e3c')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
