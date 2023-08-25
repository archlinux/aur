# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-stream
pkgver=1.0.1
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
sha256sums=('65ebdb1183b306eb278f16f31d304dc2295c60d2d9fac00b0eaaf92a147ff8bd')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
