# Maintainer: kilo

pkgname='kilo-bin'
pkgver=1.0.21
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilo'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('80085963e855dfbf5dcdd1ab326cfe0f18b46d903a69c563b701ca2d276e6f84')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('297c046bbc42d731a5a00c47c848c39775b1448c1a3de4f0fbecf071a37d747b')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
