# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='gotify-cli'
pkgname="${_pkgname}-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc='Command line interface for pushing messages to gotify server'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/gotify/cli'
license=('MIT')
provides=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm-7")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums=('14f4b519a207caf5a79174361de18eaaf856e1f10a7dba30787530b332cccd61'
            '5df0ff608e5281cbd72c7087c1f60b0ed241a627d6249b89ad9da8853c7771f7')
sha256sums_x86_64=('ef7f584b3e253ab4d73cfd602fac5d6ba0fdc4a970c18e5fc3cf560af956e4cd')
sha256sums_armv7h=('4cf4cf6042d192fa3e1596a27f3dd4b3f03c26a7b4d2d191a3fe7ac198e23d07')
sha256sums_aarch64=('2067e3ded30be36e392c370d846addf9f22362289d24bd5f72dfd6fd0efeea59')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
