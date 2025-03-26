# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

pkgname=mpris-discord-rpc
pkgver=0.2.2
pkgrel=1
pkgdesc='MPRIS Discord music rich presence status with support for album covers and progress bar.'
url="https://github.com/patryk-ku/${pkgname}"
license=('MIT')
arch=('x86_64')
source=(
    "${pkgname}-v${pkgver}::${url}/releases/download/v${pkgver}/${pkgname}"
    "https://raw.githubusercontent.com/patryk-ku/${pkgname}/main/LICENSE"
)
sha512sums=(
    'f7376432875872a509e0f67801c22d12f48c98cf94cf6076a38a1ebdc31c99ed55e082529ce23684b76041f82b81b5481edd7af7b6f56b44555d3df060cd1df8'
    'c2b16df74d9a4a258961ae1d9b67bd222bf3133a36e0e8425b83163b9fd8c68e9c5df7f23c41067e80ae2639e0d3d1b0235708cb097f2213a6e80882aebd14d2'
)

package() {
	install -Dm755 "${pkgname}-v${pkgver}" "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
