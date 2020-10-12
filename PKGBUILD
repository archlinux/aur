# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=cocogitto-bin
_pkgname=cocogitto
pkgver=1.0.2
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

md5sums_x86_64=('df88609d08bc9ef597c8b75c9ee4493e')
md5sums_armv7h=('470ac20c523f46a287cce107603198a0')
md5sums_aarch64=('47d2b30e4f7b4bd7424ddff159393148')
