# Maintainer: pusi77 <pusineriandrea+gmail+com>
# Contributor: pusi77-robot <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=1.5.1
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
sha256sums_x86_64=('86d94c60c0daa54868ad0257ffe8ec8f877456f02f23d894181518705e4fed62')
sha256sums_aarch64=('16b0af72d4ea62531af1e52fb287ec6f3a9c31d56a280b49bd851d812a726067')
