# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

pkgname=mpris-discord-rpc
pkgver=0.2.1
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
    'ef120214889f4d7d7b173553335cb4d594d170e1950049a4340a4435aa56bd34aacdba8d02a03f6187c17fb5d2a7f5c0fcc84dc43ac4445edb5ccc919ff43722'
    'c2b16df74d9a4a258961ae1d9b67bd222bf3133a36e0e8425b83163b9fd8c68e9c5df7f23c41067e80ae2639e0d3d1b0235708cb097f2213a6e80882aebd14d2'
)

package() {
	install -Dm755 "${pkgname}-v${pkgver}" "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
