# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=ytdl-sub
pkgname=$_pkgbin-bin
pkgver=2023.11.25
pkgrel=1
pkgdesc="Automate downloading and metadata generation with yt-dlp"
arch=('x86_64')
url="https://github.com/jmbannon/ytdl-sub"
license=('GPL3')
source=("${_pkgbin}-${pkgver}-${pkgrel}::${url}/releases/download/${pkgver}/${_pkgbin}")
sha512sums=('78c17025c0fcad0bac37acaa78eb831a7873a1c4d3149d47912aae11fd256c855343ca84de379b70bc93962296c89c46fa1d452dba7cbb0229b1055e69fd9efd')

package(){
  # Install Binary
  install -Dm755 ${_pkgbin}-${pkgver}-${pkgrel} ${pkgdir}/usr/bin/$_pkgbin
}
