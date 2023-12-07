# Maintainer: taotieren <admin@taotieren.com>

pkgname=unshc
pkgver=0.8
pkgrel=2
epoch=
pkgdesc="UnSHc is a tool to reverse the encryption of any SHc encrypted *.sh.x script. (shc < 4.0.3)"
arch=('x86_64')
url="https://github.com/yanncam/UnSHc"
license=('GPL3')
groups=()
depends=('bash')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

package() {

    install -Dm0755 "${srcdir}/${pkgname}/release/${pkgver}/${pkgname}-v${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
