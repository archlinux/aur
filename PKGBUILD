# Maintainer: Crusher <TheAnonymousCrusher>
pkgname=yt-nerddl
pkgver=2026.03.25
pkgrel=1
pkgdesc="Interactive YouTube downloader wrapper around yt-dlp with nice UI"
arch=('any')
url="https://github.com/TheAnonymousCrusher/yt-nerddl"
license=('MIT')
depends=('python' 'ffmpeg' 'yt-dlp')
source=("yt-nerddl.py")
sha256sums=('24052a9188fc3b44aa838e1f0c0aed84f2bc2956513529252b75856ceaf5388e')

package() {
  install -Dm755 "${srcdir}/yt-nerddl.py" "${pkgdir}/usr/bin/yt-nerddl"
}
