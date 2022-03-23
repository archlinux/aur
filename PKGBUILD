# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ez
pkgver=1.0.r1
pkgrel=1
pkgdesc='Task simplificaltion aimed at increasing the speed and efficiency of common tasks'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('00910f76353d6a68510c4feb20a4583e630459e9ae4d94676a9749e75fff73f9')

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
