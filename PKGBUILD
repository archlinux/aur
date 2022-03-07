# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.6.3
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')
b2sums_x86_64=('85d72236ad1b65f4809bd62020ba856b19d5675d76931892409457df347c4a6ec7fa10aeda07d0550f6e9c54082089f7544ca1e0ff0114bc484da35a6b712d45')
b2sums_armv6h=('c7c4af5ddd26c1fe5f6411cf896334c47747a05b579633c56539e0ad32b7262907672428b3ec6c8f110a82dc33646c3b890f1452448fbd03260cb7dc716b4476')
b2sums_aarch64=('31ed5e54ebf357dc4806b5b3b0f20b331ca3c383a8733fbf69addb0cf1dac42357a50da4711bbffd9da80b780797f34fbcc9af45687d76c3eddd56634c418311')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
