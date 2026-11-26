# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=best-claude-hud-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Minimal statusline HUD for Claude Code"
arch=('x86_64')
url="https://github.com/GaoSSR/best-claude-hud"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/GaoSSR/best-claude-hud/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/best-claude-hud-linux-x64-musl.tar.gz")
sha256sums=('9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3')
sha256sums_x86_64=('25867fa8518ce0d487a9c0dc0da72c6ea405632579de985edd45a563391eabb8')

package() {
  install -Dm755 "best-claude-hud" "${pkgdir}/usr/bin/best-claude-hud"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
