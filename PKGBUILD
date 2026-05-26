# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=dagger-bin
pkgdesc="Automation engine to build, test and ship any codebase. Runs locally, in CI, or directly in the cloud"
pkgver=0.21.0 # renovate: datasource=github-tags depName=dagger/dagger
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
sha256sums_x86_64=('6780df6ec51903c8dc5e660c4d8cdb78d859fea138070974d03aa13c5bf0013d')
sha256sums_aarch64=('8d4f3acb03118846563befa889326ab4bd20274b814700b95a9598d50adee982')
sha256sums_armv7h=('8928c3ee43c7334021ebb34feeb9c3b713d50988825b54c11b6dc647e9f87e0f')

package() {
  install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
