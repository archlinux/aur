# Maintainer: RAI SULEMAN <cerebellumdigital@email.com>


pkgname=ytdl
pkgver=1.0.0
pkgrel=1
pkgdesc="An interactive and colorful Bash wrapper for yt-dlp with parallel/playlist support."
arch=('any')
url="https://github.com/codewithmoss/ytdl"
license=('MIT')
depends=('yt-dlp' 'aria2' 'jq' 'bash')
source=("${pkgname}.sh::https://raw.githubusercontent.com/codewithmoss/ytdl/main/ytdl.sh")
md5sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}


post_install() {
    echo "✅ ytdl installed successfully!"
    echo "Run 'ytdl' to download YT videos in parallel, sequence or single."
    echo "For help, visit: https://github.com/codewithmoss/ytdl"
}

