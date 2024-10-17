# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=ytdl-sub
pkgname=$_pkgbin-bin
pkgver=2024.10.09
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('x86_64')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL3')
source=("${_pkgbin}-${pkgver}-${pkgrel}::${url}/releases/download/${pkgver}/${_pkgbin}")
sha512sums=('c81b6592570065660944bc4320d04ec584b91ed06bb7f211ca5820c0db9af58755679fe12e4cc210bf140dce2dd79e7de4dace57b1891864ffbb48304c9983fb')
depends=(libxcrypt-compat ffmpeg)

package(){
  # Install Binary
  install -Dm755 ${_pkgbin}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}
