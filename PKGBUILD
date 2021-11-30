# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=cocogitto-bin
_pkgname=cocogitto
pkgver=4.0.0
pkgrel=1
pkgdesc='The conventional commits toolbox'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/cocogitto/cocogitto'
license=('MIT')
makedepends=('git')

provides=('cocogitto')
source=("$url/releases/download/$pkgver/${_pkgname}-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_armv7h=("$url/releases/download/$pkgver/${_pkgname}-${pkgver}-armv7-unknown-linux-musleabihf.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/${_pkgname}-${pkgver}-aarch64-linux-android.tar.gz")

package() {
    install -Dm755 "${srcdir}/cog" "${pkgdir}/usr/bin/cog"
    install -Dm755 "${srcdir}/coco" "${pkgdir}/usr/bin/coco"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('6305efc833f24718e56b5dbd62537bc3')
md5sums_armv7h=('e73716757add18a4bcaa93ef0afc6fcb')
md5sums_aarch64=('7f3ff6c2377e5f28c7117d4c244337cc')
