# Maintainer: navigaid <navigaid@gmail.com>
pkgname=yaegi
pkgver=0.0.3
pkgrel=1
pkgdesc='Yaegi is Another Elegant Go Interpreter'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/containous/yaegi'
license=('Apache')
makedepends=()
source=()
sha256sums=()
case "$CARCH" in
  armv5h)
    _pkgarch="armv5"
    source+=("${pkgname}-${pkgver}-${_pkgarch}.tar.gz::https://github.com/containous/yaegi/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_${_pkgarch}.tar.gz")
    sha1sums+=('f3da2b9bbdf60c2a597617ed78770a1c816947bc4d174462d5a70f91ec28fa1a')
    ;;
  armv6h)
    _pkgarch="armv6"
    source+=("${pkgname}-${pkgver}-${_pkgarch}.tar.gz::https://github.com/containous/yaegi/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_${_pkgarch}.tar.gz")
    sha1sums+=('70dd954e1112eaba39d46520b23000335ff2ad6440858a5ca74c7a014bbacd32')
    ;;
  armv7h)
    _pkgarch="armv7"
    source+=("${pkgname}-${pkgver}-${_pkgarch}.tar.gz::https://github.com/containous/yaegi/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_${_pkgarch}.tar.gz")
    sha1sums+=('38c9d0d67771927ca877679f3f1443e1f2aa8c6de92ea142c81792be208399e7')
    ;;
  aarch64)
    _pkgarch="arm64"
    source+=("${pkgname}-${pkgver}-${_pkgarch}.tar.gz::https://github.com/containous/yaegi/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_${_pkgarch}.tar.gz")
    sha1sums+=('c32f64d3fd2ed0e123161f63c96360a6f6ece176dc9ea086a09e9c9fb04c2bfe')
    ;;
  i686)
    _pkgarch="386"
    source+=("${pkgname}-${pkgver}-${_pkgarch}.tar.gz::https://github.com/containous/yaegi/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_${_pkgarch}.tar.gz")
    sha256sums+=('5f05786a4b74a665e1b66caeb59814a852793bed677f765d99d7f432de50e24d')
    ;;
  x86_64)
    _pkgarch="amd64"
    source+=("${pkgname}-${pkgver}-${_pkgarch}.tar.gz::https://github.com/containous/yaegi/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_${_pkgarch}.tar.gz")
    sha256sums+=('c32f64d3fd2ed0e123161f63c96360a6f6ece176dc9ea086a09e9c9fb04c2bfe')
    ;;
esac

prepare() {
  true
}

build() {
  true
}

package() {
  install -Dm755 yaegi "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
