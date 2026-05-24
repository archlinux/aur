# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
pkgver=0.9.94
pkgrel=1
_pkgcom=4104
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.ap-i.net/ccdciel"
license=('GPL-3.0-or-later')
depends=('libpasastro' 'qt5pas')
optdepends=('libraw: to open DSLR raw files')
conflicts=('ccdciel-git')
source=()
sha256sums=()
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${pkgname}_${pkgver}-${_pkgcom}_amd64.deb")
sha256sums_x86_64=('5e2d3044121275e07d223fe6cf18d40f0c90b93f2cde133711a45ab14dba2dd1')
source_aarch64=("${pkgname}-${pkgver}_arm64.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${pkgname}_${pkgver}-${_pkgcom}_arm64.deb")
sha256sums_aarch64=('5b63511fa8bf5405e3721dce1582694e331f2bb9d76d7bc8440a6f22b4e096cc')
source_armv7h=("${pkgname}-${pkgver}_armhf.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${pkgname}_${pkgver}-${_pkgcom}_armhf.deb")
sha256sums_armv7h=('2cc715cdcb197cba61f91006d710704d964440eaf546f73198946b8c63868310')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    chmod 755 "${pkgdir}/usr"
    chown -R root:root "${pkgdir}/usr"
}
