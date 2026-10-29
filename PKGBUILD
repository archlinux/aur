# Maintainer: pusi77 <pusineriandrea+gmail+com>
# Contributor: pusi77-robot <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=1.7.6
pkgrel=1
source_x86_64=("https://github.com/AleG03/awsm/releases/download/v${pkgver}/awsm_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/AleG03/awsm/releases/download/v${pkgver}/awsm_${pkgver}_linux_arm64.tar.gz")
pkgdesc='A fast command-line tool to manage your AWS profiles, sessions, and console access with ease'
arch=('x86_64' 'aarch64')
url="https://github.com/AleG03/awsm"
license=('BSL-1.1')
provides=('awsm')
conflicts=('awsm')

package() {
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
sha256sums_x86_64=('0d1147b631e84909a3a434648d78271cf0361c7203e59b9f9eabd6611881ce65')
sha256sums_aarch64=('0619f34c020eff1e53966d1c5c7de604c0eda85b9a2f19959a1cc674704fef58')
