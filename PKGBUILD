# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=gh-aw-bin
pkgdesc="GitHub Agentic Workflows"
pkgver=0.62.2 # renovate: datasource=github-tags depName=github/gh-aw
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/github/gh-aw"
license=('MIT')
provides=('gh-aw')
conflicts=('gh-aw')
_url_base="${url}/releases/download/v${pkgver}"
source_x86_64=("gh-aw::${_url_base}/linux-amd64")
source_aarch64=("gh-aw::${_url_base}/linux-arm64")
source=("LICENSE::https://raw.githubusercontent.com/github/gh-aw/v${pkgver}/LICENSE")
sha256sums=('2510b446bc1f0cf9702453075d20cd88631e20e5642658edb7325d9c1eb534f7')
sha256sums_x86_64=('3a6dadcb38c8ba22cb353332c8f39797948d5c0b1c1f9c71d201eb7c92012a19')
sha256sums_aarch64=('3a6dadcb38c8ba22cb353332c8f39797948d5c0b1c1f9c71d201eb7c92012a19')
noextract=('gh-aw')

package() {
  install -Dm755 "${srcdir}/gh-aw" "${pkgdir}/usr/bin/gh-aw"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
