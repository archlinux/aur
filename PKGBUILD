# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jose M. Garcia <josemaria.alkala at gmail dot com>
_pkgname='mchfuse'
pkgname="${_pkgname}-bin"
pkgver="0.4.0"
pkgrel=1
epoch=0
pkgdesc="Western Digital My Cloud Home FUSE file system"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'armv5h')
url="https://github.com/mnencia/mchfuse"
license=('Apache License 2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_x86_64.tar.gz" "mchfuse.conf")
source_aarch64=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_arm64.tar.gz" "mchfuse.conf")
source_armv7h=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_armv7.tar.gz" "mchfuse.conf")
source_armv6h=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_armv6.tar.gz" "mchfuse.conf")
source_armv5h=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_armv5.tar.gz" "mchfuse.conf")

noextract=()
md5sums_x86_64=('5e12fc1c63ab9acc708e68554d786808'
                'fa672977e621324c4dd65fb9d2506c20')
md5sums_aarch64=('da2f45c4c50ae020cfd622a9840c0d0a'
                 'fa672977e621324c4dd65fb9d2506c20')
md5sums_armv7h=('107316cb2305294064b7c70d2af25694'
                'fa672977e621324c4dd65fb9d2506c20')
md5sums_armv6h=('b38b9a83acca689de94ba7970a5a9f4d'
                'fa672977e621324c4dd65fb9d2506c20')
md5sums_armv5h=('4fcc323149863b3a4357e7529d1fe6c8'
                'fa672977e621324c4dd65fb9d2506c20')
validpgpkeys=()
backup=('etc/mchfuse.conf')

package() {
    install -Dm 655 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 600 "${_pkgname}.conf" "${pkgdir}/etc/${_pkgname}.conf"
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname-bin}/LICENSE
}
