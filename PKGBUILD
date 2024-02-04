# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=mp4grep-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="mp4grep is a CLI for transcribing and searching audio/video files"
url="https://github.com/o-oconnell/mp4grep"
conflicts=('mp4grep' 'mp4grep-git')
license=('GPL-3.0')
depends=('vosk-api')
arch=('x86_64')

source=("${url}/releases/download/${pkgver}-linux-x86/binary-mp4grep-${pkgver}-linux-x86.zip")
sha256sums=('5928e96eebc9052208489a2ed37d97201de2e4947021ffeb0da131c2595cbc9d')

package() {
    cd mp4grep/bin/

    install -Dm755 mp4grep "${pkgdir}/usr/bin/mp4grep"
    install -Dm755 mp4grep-convert "${pkgdir}/usr/bin/mp4grep-convert"
}
