# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-kots-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=1.90.0
pkgrel=1
pkgdesc='Kubectl plugin and admin console to help manage Kubernetes Off-The-Shelf (KOTS) software'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://kots.io"
license=('Apache')
depends=('kubectl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname2}_${pkgver}_${_goos}_${_goarch}.tar.gz::https://github.com/replicatedhq/$_pkgname2/releases/download/v$pkgver/${_pkgname2}_${_goos}_${_goarch}.tar.gz")

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
b2sums=('7786f343496c489b6e1fa4815e9a2d4cc5337368e2e911e2b8a76e8b883e020a4c1aa28df8f45ba80413022d94d1fa9ceb2ac38728a910bd17dfd657e393d9bf')
b2sums=('931654f17051609a3f0d059b1b4f6d9b1bf0af07a082c251f21b56da1aaeddc1b817e91f3c995f104a2b85d0c70d2ee1a255ab4acfae80b67b44cce41138c3a8')
