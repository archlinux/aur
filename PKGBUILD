# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="go-http-file-server"
_binname="ghfs"
pkgname=${_pkgname}-bin
pkgver=1.18.1
pkgrel=1
pkgdesc="Simple command line based HTTP file server to share local file system"
arch=('x86_64' 'x86_64_v3' 'i686' 'aarch64' 'arm' 'loong64' 'riscv64')
url="https://github.com/mjpclab/${_pkgname}"
license=('MIT')
provides=("${_binname}")
conflicts=("${_binname}")
source=("${url}/raw/v${pkgver}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-amd64v2.zip")
source_x86_64_v3=("${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-amd64v3.zip")
source_i686=("${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-386.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm64.zip")
source_arm=("${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm.zip")
source_loong64=("${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-loong64.zip")
source_riscv64=("${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-riscv64.zip")
sha256sums=('cf70e6d80ed8bf4979e830d9a278b84b4733d984c9444248792b9d6771767d2a')
sha256sums_x86_64=('789e9cf0bf706f478a8b70352497f6e683c3cea7c54a66ef5bd3494c2cecba74')
sha256sums_x86_64_v3=('ee64b44df04d27635b2a87a6f20fa9154ed275edafc9e74e1d84b0ef90dc23c5')
sha256sums_i686=('5c0cdf88d3b2f133fef1157128cbfbf1e6f5c76247067ce3b2fc1a5dba24ac8d')
sha256sums_aarch64=('f98e379d6536c7f460046428059951246f770fe67023d0c14c435e52643f04c6')
sha256sums_arm=('3527cf996285548f18daab08896fe7cd46e1d76172c82027a88971d215236be5')
sha256sums_loong64=('e9e5076bb0effa4064cd9b364826b3b9ab57b18822681f3b81f049684cae93c1')
sha256sums_riscv64=('76258e2a6d5cefc6c328eb8983d51483eb1f69a5031e7a97d771e8223dc75960')

package() {
  cd "${srcdir}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
