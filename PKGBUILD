# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-cli
_pkgname=pnpm
pkgver=9.15.0
pkgrel=1
pkgdesc="Fast, disk space efficient package manager (Pure Packaging, no dependencies)"
arch=('x86_64' 'aarch64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
conflicts=(${_pkgname})
provides=(${_pkgname})
options=('!strip')
source_x86_64=(${pkgname}-${pkgver}-x86_64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-x64)
source_aarch64=(${pkgname}-${pkgver}-aarch64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-arm64)
_app=${pkgname}-${pkgver}-${CARCH}

package() {
	install -Dm755 "${srcdir}/${_app}" "${pkgdir}/usr/bin/pnpm"
}
sha256sums_x86_64=('f389709623d29195c5555a32513d633d28aa457c30448d0bb8d87439c7b127dc')
sha256sums_aarch64=('1f66770efc74835602642c37b8d31c635c0a90bdfc1401c273c6e957714b7561')