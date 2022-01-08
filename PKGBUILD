# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=postsack-bin
_pkgname=postsack
pkgver=1.0.0
pkgrel=1
pkgdesc="A high level visual overview of swaths of email."
arch=('x86_64')
url="https://github.com/terhechte/postsack"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/terhechte/postsack/v1.0.0/LICENSE.md")
source_x86_64=("https://github.com/terhechte/postsack/releases/download/v${pkgver}/postsack_${pkgver}_amd64.deb")
noextract=("${_pkgname}_${pkgver}_linux_amd64.deb")
sha256sums_x86_64=("6b318be6f452f51217ed1da28699a441f41d1856a237ce1c469d2075ef503f8f")
sha256sums=("27a8dc9b024005e4298e225801161df5db47f2ad5f82b03560a3584370c35d61")

package() {
   bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
