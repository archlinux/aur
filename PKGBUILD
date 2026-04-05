# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.21
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilocode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('2228920c188d368c82c68a99a2030de8db31c0df7afc7fc48c5cfe3cd522b848')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('8489572ee79f4479c67eec311083fc59785479640edaa9bd18bc0ca97f79727a')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
