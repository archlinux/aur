# Maintainer: Karol Babioch <karol@babioch.de

pkgname=aaxtomp3
pkgver=1.0
pkgrel=1
pkgdesc='The purpose of this software is to convert AAX files to a more common MP3 format through a basic bash script frontend to FFMPEG.'
arch=('any')
url='https://github.com/KrumpetPirate/AAXtoMP3'
license=('custom')
depends=('ffmpeg' 'lame')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -Dm 755 AAXtoMP3 "$pkgdir/usr/bin/AAXtoMP3"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

