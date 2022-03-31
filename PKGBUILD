# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=dagger-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='A portable devkit for CI/CD pipelines'
arch=('x86_64' 'aarch64')
url='https://github.com/dagger/dagger'
license=('Apache License 2.0')
depends=()
makedepends=()
source_x86_64=("https://github.com/dagger/dagger/releases/download/v${pkgver}/dagger_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/dagger/dagger/releases/download/v${pkgver}/dagger_v${pkgver}_linux_arm64.tar.gz")
sha512sums_x86_64=('38d18b69459190e0b14d6cebd24c35b376b456a5d861c5c1b8bde5deb0dc90a6f4ea31c2b5d7344b335657b42c358bdd53c044e98132a0f27b73992edd951b7b')
sha512sums_aarch64=('eb2e9875351220088567cc0d99b2e896d85ff6ab3da30de7ebfc964859eb4a07b80135697226ab5b16b3b000fda24ad678296f29b3add3bebb6722a269c43a80')

package() {
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
}
