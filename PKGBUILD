# Maintainer: 27Co <Co.balt@outlook.com>

pkgname=zipzap
pkgver=0.0
pkgrel=1
epoch=
pkgdesc="Shell tool for jumping across directories in terminals"
arch=(any)
_reponame=ZipZap
url="https://github.com/27Co/${_reponame}"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
noextract=()
validpgpkeys=()
sha256sums=('75b1b573fd0fc614b938946663660005e283d219ca9ac10c00b228697a554a43')

package() {
    install -vDm 644 ${_reponame}-${pkgver}/${pkgname}.sh -t "${pkgdir}/usr/share/${pkgname}/"
    install -vDm 644 ${_reponame}-${pkgver}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm 644 ${_reponame}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
