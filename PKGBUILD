# Contributor: Fabio 'Lolix' <fabio.loli@disroot.org>
# Contributor: Aniket-Pradhan aniket17133@iiitd.ac.in
# Contributer: Peter Hofmann <insert_email_here>

pkgname=birtty
pkgver=18.06
pkgrel=2
pkgdesc="Try not to crash that bird"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://www.uninformativ.de/git/birtty/file/README.html"
license=(MIT)
makedepends=(git)
source=("git+https://www.uninformativ.de/git/birtty.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/birtty"
  make
}

package() {
  cd "${srcdir}/birtty"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
