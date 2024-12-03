# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-cli
_pkgname=pnpm
pkgver=9.14.4
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
sha256sums_x86_64=('8cb777303c274f1fb7f7ab438abb939d047c07218da20b46bc8df5f05e6d8947')
sha256sums_aarch64=('453c2a4b3bfa65f9dd827051612742fa59c7f1ed7838b8471634e95821039a61')