# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=cocogitto-bin
_pkgname=cocogitto
pkgver=1.1.0
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

md5sums_x86_64=('53ba4a0ab4b92c4e5949f626692691f0')
md5sums_armv7h=('93c19155559044451949da6daf285f91')
md5sums_aarch64=('ede2dee5e71da83b0b550ff59d61157c')
