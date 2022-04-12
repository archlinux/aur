# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=dagger-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='A portable devkit for CI/CD pipelines'
arch=('x86_64' 'aarch64')
url='https://github.com/dagger/dagger'
license=('Apache License 2.0')
conflicts=('dagger')
depends=()
makedepends=()
source_x86_64=("https://github.com/dagger/dagger/releases/download/v${pkgver}/dagger_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/dagger/dagger/releases/download/v${pkgver}/dagger_v${pkgver}_linux_arm64.tar.gz")
sha512sums_x86_64=('b1a0a4aeb55c9902d73f23d6ea72fb6df14ced3e254c65f81cb4f13a963cefe048f490dc4f24b2303f3d4bf38f52ca8e0ee5b41680a4a9d38bf61e7cfb22e02b')
sha512sums_aarch64=('6db141459414041c32a45d3e75d46e3974d7a9a7488cc31f7acafa48869b44306385da571e1afbbe51eb7a1ae71ec70a03a4f25c15a6e59ded33537642f540ed')

package() {
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
}
