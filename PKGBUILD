# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

pkgname=gitlab-glab-bin
pkgver=1.9.1
pkgrel=1
epoch=
pkgdesc="A custom GitLab CLI tool written in Go"
arch=(x86_64)
url="https://github.com/profclems/glab"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('gitlab-glab')
conflicts=('gitlab-glab')
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/v${pkgver}/glab_${pkgver}_Linux_x86_64.tar.gz")
noextract=()
sha256sums=('7a0b5395e549de06692079f3f18dd45c9f7403f9047930d26e29aae5cf42eca4')
validpgpkeys=()

package() {
	install -D glab "${pkgdir}/usr/bin/glab"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
