# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=dagger-bin
pkgver=0.2.5
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
sha512sums_x86_64=('1ffb368c05dd5de1021dd9c62f0a426b69bcb705562ce4e31b1a0f2a0244ae344c45781de88e349885183e0f86784688c8fe9f7dbaf52c5bf91f8bfbe2d2fc95')
sha512sums_aarch64=('471c57f04c2ab9a8f7bbff70f75c2358e7c6d42eb274628ba118d8824b222bcdd8509868d63009e2c8b4ff1cf15d3207c930ccd50c3eaa0358e273da120ad275')

package() {
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
}
