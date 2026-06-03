# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=dagger-bin
pkgdesc="Automation engine to build, test and ship any codebase. Runs locally, in CI, or directly in the cloud"
pkgver=0.21.4 # renovate: datasource=github-tags depName=dagger/dagger
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
sha256sums_x86_64=('4db2f807b67e3160fb110bb1e088b14c516594b8d287114a39c980f2485e9672')
sha256sums_aarch64=('d4610ec53c77eef7a5610b732b9e9b0d26c3f1c5911ef99e5e8e5c9e7cf6880e')
sha256sums_armv7h=('93941714bd664b9c1a0fbfaabd95aa1cd9bc150abc42198027a40b94dd019c9d')

package() {
  install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
