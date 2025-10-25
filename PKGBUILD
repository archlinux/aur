# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=ytdl-sub
pkgname=$_pkgbin-bin
pkgver=2025.10.23
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('x86_64')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL3')
source=("${_pkgbin}-${pkgver}-${pkgrel}::${url}/releases/download/${pkgver}/${_pkgbin}")
sha512sums=('a27966be5b4ca6f486b7450acb391018204e23da57a3550050152a52130ce8f1a4333127ec7d835030f17f06bcbf3ae37bba9c67460e5a16dd8253092d05d2f2')
depends=(libxcrypt-compat ffmpeg)

package(){
  # Install Binary
  install -Dm755 ${_pkgbin}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}
