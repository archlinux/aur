# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=cocogitto-bin
_pkgname=cocogitto
pkgver=4.0.1
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

md5sums=('88839fcdafa52de178239bf179e03f52')
md5sums_armv7h=('deb2e132de756cb738fb2a2dddd4f602')
md5sums_aarch64=('300357f41d72b0795236dfaee3ad7877')
