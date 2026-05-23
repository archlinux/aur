# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
_pkgname=ccdciel-qt6
pkgver=0.9.94
pkgrel=1
_pkgcom=4104
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.ap-i.net/ccdciel"
license=('GPL-3.0-or-later')
depends=('libpasastro' 'qt6pas')
optdepends=('libraw: to open DSLR raw files')
conflicts=('ccdciel-git')
source=()
sha256sums=()
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${_pkgname}_${pkgver}-${_pkgcom}_amd64.deb")
sha256sums_x86_64=('ef2931ac3da5658f46c68845a81b4c6e1076b22b8736ac9359dcb1a878d0e640')
source_aarch64=("${pkgname}-${pkgver}_arm64.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${_pkgname}_${pkgver}-${_pkgcom}_arm64.deb")
sha256sums_aarch64=('c040cbbffd63f1105eb9d25e5d71428e279088ba9ce4283e6abae971a8c46328')
source_armv7h=("${pkgname}-${pkgver}_armhf.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${pkgname}_${pkgver}-${_pkgcom}_armhf.deb")
sha256sums_armv7h=('2cc715cdcb197cba61f91006d710704d964440eaf546f73198946b8c63868310')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    chmod 755 "${pkgdir}/usr"
    chown -R root:root "${pkgdir}/usr"
}
