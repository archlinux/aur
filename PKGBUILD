# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-cli
pkgver=9.13.2
pkgrel=3
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
sha256sums_x86_64=('63fe24681366d01f0870ad2cb79ab1943ffdaac944d50398c9f65aa77f71a3ef')
sha256sums_aarch64=('395b9b5a8d3cc6813715af0b3be38e6cd2583352ef7ab9665d677a901abab34d')