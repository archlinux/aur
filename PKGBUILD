# Maintainer: SunParis <132213306+SunParis@users.noreply.github.com>

pkgname=gitcommitgenerator-bin
_pkgname=gitcommitgenerator
pkgver=0.1.1
pkgrel=1
pkgdesc='AI-powered Git commit message generator with configurable OpenAI-compatible LLM support'
arch=('x86_64')
url='https://github.com/SunParis/GitCommitGenerator'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')
source_x86_64=("${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a170101d53dddfd419df87e51309ba9fe6acfc1ca89aa0e4b46d8bd9468f10a1')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
