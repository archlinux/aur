# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=ytdl-sub
pkgname=$_pkgbin-bin
pkgver=2024.01.09.post2
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('x86_64')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL3')
source=("${_pkgbin}-${pkgver}-${pkgrel}::${url}/releases/download/${pkgver}/${_pkgbin}")
sha512sums=('9e0bc77267326737992a25796af6a9e20db18b03644974e8d5ce72d8e2ec7eabec77e645fa7ee4407ead4e9eacaba05d3771bfbf78e2e6e45d34d60b32e680db')
depends=(libxcrypt-compat)

package(){
  # Install Binary
  install -Dm755 ${_pkgbin}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}
