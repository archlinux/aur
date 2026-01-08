pkgname=yt-nerddl
pkgver=4.4.3
pkgrel=1
pkgdesc="Interactive YouTube downloader wrapper around yt-dlp with nice UI"
arch=('x86_64')
url="https://github.com/TheAnonymousCrusher/yt-nerddl"
license=('MIT')
depends=('python' 'ffmpeg' 'yt-dlp')
source=("https://github.com/TheAnonymousCrusher/yt-nerddl/archive/refs/heads/main.zip")
sha256sums=('SKIP') # replace with actual sum if you want verification

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "yt-nerddl-main/yt-nerddl.py" "$pkgdir/usr/bin/yt-nerddl"
}
