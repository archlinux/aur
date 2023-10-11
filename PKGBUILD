# Maintainer: ShalokShalom < shalokshalom at proton dot me >
# Contributor: Jingu <xiuluo dot android at gmail dot com>
# Contributor: Daniel Souza <aur at posix dot dev dot br>

_pkgauthor="chainner-org"
_pkgname="chainner"
pkgname="${_pkgname}20-bin"
pkgver=0.20.1
pkgrel=1
pkgdesc='Node-based image processing and AI upscaling GUI'
arch=('x86_64')
url="https://github.com/chaiNNer-org/chaiNNer/"
license=('GPL3')
depends=('libxcrypt-compat')
provides=("${_pkgname}")
options=('!emptydirs' '!strip')
source=("https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64-linux-redhat.rpm")
sha512sums=('b129c4d8c69d9d253c6705a454d0b27734c0da5a9f2319473101889f21da3e2806f9152e321360398e0c59fe72a4ccfdf51ce1aeae6c4ed6aab53efe5c37089a')
package() (
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/lib/${_pkgname}/." "${pkgdir}/usr/lib/${_pkgname}/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
