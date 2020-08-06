# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

pkgname=gitlab-glab-bin
pkgver=1.7.0
pkgrel=2
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
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/v1.7.0/glab_1.7.0_Linux_x86_64.tar.gz")
noextract=()
md5sums=("f1de14bebd78fefe39414cf95f4f2dfa")
validpgpkeys=()

package() {
	install -D glab "${pkgdir}/usr/bin/glab"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
