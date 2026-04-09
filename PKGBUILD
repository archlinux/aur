# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=dagger-bin
pkgdesc="Automation engine to build, test and ship any codebase. Runs locally, in CI, or directly in the cloud"
pkgver=0.20.4 # renovate: datasource=github-tags depName=dagger/dagger
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
sha256sums_x86_64=('9127c8211786aacc6cc8a49cc82ffea2aa75fb24e23ff49a85930505bfff3c14')
sha256sums_aarch64=('3941c6279dc29831e109eb61862b62ecadcf6507b64e0e329cd40b3851a85767')
sha256sums_armv7h=('dd5ef73e36d4049905b1478ea23e4fbc37ba085d5a2e3440c4ff9b996e1be94f')

package() {
  install -Dm755 "${srcdir}/dagger" "${pkgdir}/usr/bin/dagger"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
