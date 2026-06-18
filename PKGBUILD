# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=dagger-bin
pkgdesc="Automation engine to build, test and ship any codebase. Runs locally, in CI, or directly in the cloud"
pkgver=0.21.7 # renovate: datasource=github-tags depName=dagger/dagger
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/dagger/dagger"
license=('Apache-2.0')
provides=('dagger')
depends=('glibc')
options=('!strip')
conflicts=('dagger')
source_x86_64=("https://github.com/dagger/dagger/releases/download/v${pkgver}/dagger_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/dagger/dagger/releases/download/v${pkgver}/dagger_v${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/dagger/dagger/releases/download/v${pkgver}/dagger_v${pkgver}_linux_armv7.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/dagger/dagger/v${pkgver}/LICENSE")
sha256sums=('4442a42853bd02d190ce5f06f76ba62f1a0ff803e8cc1a524dcaa7085a0b100b')
sha256sums_x86_64=('44430afc6f9c390fc47c4f352b15de9309a5e97ebd1ae563839617d6df8e8cc5')
sha256sums_aarch64=('780e8ddc4269aeee94ef21ab7cb06ca2ee04abec5486eba53f49a7549d99637d')
sha256sums_armv7h=('5947c28599fc13bae1a2bd9b19418812979ffbf94d9da39be2c80afdccc8f4e3')

package() {
  install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
