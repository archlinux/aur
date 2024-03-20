# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel-bin
_pkgname=${pkgname/-bin}
__pkgname=DPITunnel
pkgver=0.9.0
pkgrel=1
pkgdesc="Free, simple and serverless solution against censorship for Linux PCs and routers"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/txtsd/DPITunnel"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-amd64.zip")
source_i686=("${url}/releases/download/${pkgver}/${_pkgname}-x86.zip")
source_armv7h=("${url}/releases/download/${pkgver}/${_pkgname}-armhf.zip")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-arm64.zip")
sha256sums_x86_64=('48c6ae3da23e24e352e4f7aa0a6fc2a743fed62fface2c7ab4b91637366f8b6d')
sha256sums_i686=('68e331ab4e53527f9ea1658713869195a1fc6a74f66b3b7d40e928a8adfffd37')
sha256sums_armv7h=('1900c719ab70f92a4b970b48b6f2d6bc4fcaea9b818e34bcfa3786984bbfab89')
sha256sums_aarch64=('707782fc27bb604ce437e6248ba661de982d56804e3cbc915fdf144c0d24f8e9')

package() {
	install -Dm755 "${__pkgname}-exec" "${pkgdir}/usr/bin/${_pkgname}"
}
