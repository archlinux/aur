# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.2.5
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('1696ecb0bdd4c6043342add33e7f483090424456f72e96faba264c8ae7563292')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
