# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

pkgname=gitlab-glab-bin
pkgver=1.11.0
pkgrel=1
epoch=
pkgdesc="An open source GitLab CLI tool written in Go"
arch=(x86_64)
url="https://github.com/profclems/glab"
license=('MIT')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(gitlab-glab)
conflicts=(gitlab-glab)
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/v${pkgver}/glab_${pkgver}_Linux_x86_64.tar.gz")
noextract=()
sha256sums=('bc4ffbaac99344ff8cd0e8ba1d2530a946b615cd1c73b6ed529440bcc123b241')
validpgpkeys=()

package() {
	install -D glab "${pkgdir}/usr/bin/glab"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
