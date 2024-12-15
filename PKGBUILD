# Maintainer: envolution
# Contributor: Brodi <me@brodi.space>
# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=godu
pkgname=${_pkgname}-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Simple golang utility helping to discover large files/folders."
url="https://github.com/viktomas/godu"
license=(MIT)
arch=('x86_64' 'i686' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

source=("https://raw.githubusercontent.com/viktomas/godu/v${pkgver}/LICENSE.md")

sha256sums=('fbbf1cc302e3112da5f11cafa5b0cb3894c41678fffe5129443fd0da52cd30d2')
sha256sums_x86_64=('17017e52f2b36aa41697ecf556c4f41a53e8fa34da49494aa2129d7384e8fec4')
sha256sums_i686=('7daf9d79dd7b4e60b4fe22bcf857af538f79d3049d3e100076e297dcaa1ddeea')
sha256sums_aarch64=('2a16dbea0e5ec66bfc5bbed55679ede5ce2b4c33ef782827f7d27b1d597f0e38')


package() {
  install -Dm755 godu "${pkgdir}/usr/bin/godu"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
