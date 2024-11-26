# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-cli
pkgver=9.14.2
pkgrel=1
pkgdesc="Fast, disk space efficient package manager (Pure Packaging, no dependencies)"
arch=('x86_64' 'aarch64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
conflicts=('pnpm')
options=('!strip')
source_x86_64=(${pkgname}-${pkgver}-x86_64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-x64)
source_aarch64=(${pkgname}-${pkgver}-aarch64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-arm64)
_app=${pkgname}-${pkgver}-${CARCH}

package() {
	install -Dm755 "${srcdir}/${_app}" "${pkgdir}/usr/bin/pnpm"
}
sha256sums_x86_64=('dc7fa94424f75d89ef726f66467ea92f0aacb0cfb7e4c7fc2d7684cba5c18335')
sha256sums_aarch64=('74aeb6b07ce2ff52e458d6577f16db1ad53325002bdd9127aaed389b1eeb01eb')