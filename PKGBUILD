# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=ytdl-sub
pkgname=$_pkgbin-bin
pkgver=2023.12.29.post3
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('x86_64')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL3')
source=("${_pkgbin}-${pkgver}-${pkgrel}::${url}/releases/download/${pkgver}/${_pkgbin}")
sha512sums=('a1221291bac833a7e0122ca349dfdc0fb4767d6bc8431c9a33d05dddc9ec686a837de3dc07183e1acd697bafe26d6b0825dc14e8f3d3b2b90d67d16033c91cc4')
depends=(libxcrypt-compat)

package(){
  # Install Binary
  install -Dm755 ${_pkgbin}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}
