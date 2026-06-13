# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=dagger-bin
pkgdesc="Automation engine to build, test and ship any codebase. Runs locally, in CI, or directly in the cloud"
pkgver=0.21.6 # renovate: datasource=github-tags depName=dagger/dagger
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
sha256sums_x86_64=('0b10f5f464843dc154fae47279ad66e465d75a2118b32151394b7383c0eaac4f')
sha256sums_aarch64=('2fe36aca2a392152c6f1fc1e866638733cbd93720aaae77005d483ab3eba0f82')
sha256sums_armv7h=('6f43370f0c755c88896bce05f08f30747cf4a34998b285126f954e770d664fd4')

package() {
  install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
