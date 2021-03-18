# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=cocogitto-bin
_pkgname=cocogitto
pkgver=2.0.0
pkgrel=1
pkgdesc='A set of cli tools for the conventional commit and semver specifications'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/oknozor/cocogitto'
license=('MIT')
provides=('cocogitto')
source_x86_64=("$url/releases/download/$pkgver/${_pkgname}-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_armv7h=("$url/releases/download/$pkgver/${_pkgname}-${pkgver}-armv7-unknown-linux-musleabihf.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/${_pkgname}-${pkgver}-aarch64-linux-android.tar.gz")

package() {
    install -Dm755 "${srcdir}/cog" "${pkgdir}/usr/bin/cog"
    install -Dm755 "${srcdir}/coco" "${pkgdir}/usr/bin/coco"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

md5sums_x86_64=('93f7061ac6d2fbc3348fd561b8c9620e')
md5sums_armv7h=('d28cbce506c900f11d5fd7d7d2a527f7')
md5sums_aarch64=('a37732c3f42b4ecce6d74c4fb7ac838d')
