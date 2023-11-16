# Maintainer: Alan Placidina Maria <placidina[at]protonmail[dot]com>

pkgname=render-template
_pkgname=${pkgname}-linux-amd64
pkgver=1.0.6
pkgrel=1
pkgdesc="CLI tool for rendering templates with custom data"
url="https://github.com/bitnami/render-template"
arch=(x86_64)
license=(Apache-2.0)
source=(https://github.com/bitnami/render-template/releases/download/v${pkgver}/${pkgname}-linux-amd64.tar.gz)
sha512sums=('b6ea99fdf02fbf7e2475d02581ac7f4eaebcbab2a2603d1ff62782d063715a82e8f570612827709e49ac226db266f5243ac4f21abac378316d1c4aa367796ba4')

package() {
    install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
