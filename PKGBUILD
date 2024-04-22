# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Silvio <s.i.l.v.io..f.r.i.c.k.e@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>

_pkgname=shellcheck
pkgname="${_pkgname}-bin"
pkgdesc='Shell script analysis tool (binary release, static)'
pkgver=0.10.0
pkgrel=1
url='https://shellcheck.net'
arch=('x86_64' 'armv6h' 'aarch64')
license=(GPL-3.0-only)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("https://github.com/koalaman/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux.x86_64.tar.xz")
source_armv6h=("https://github.com/koalaman/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux.armv6hf.tar.xz")
source_aarch64=("https://github.com/koalaman/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux.aarch64.tar.xz")

b2sums_x86_64=('9cf6eeccb13770808a6efdedd27b85c925f0ab899a82ac8fdf8c16e9133d3f91b5b80900a3c1e11ee7b0b035aab1c08d439b682a479c5b47a218e55bc08562c5')
b2sums_armv6h=('89788bf2de2c7c1fc1b78a64c1e28c08fea5fd29928c198cb80989191f63bcda6c9e0ebda5a5ffb471f7331292740486bc2f1cc894d30e8b704e6d2fb4a925f1')
b2sums_aarch64=('6402fe9230c44dbf4620d019bd505246f06d7b96233d57b154f1b6a453f116e8c633768f8bce8f2031672a8df7dcac4de9ea5ebf6274444e450718b1cd300b4b')

package() {
    install -Dm755 "${_pkgname}-v${pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin"
}
