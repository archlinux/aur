# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=jetbrains-lxgw-nerd-mono-ttf
pkgver=1.3
pkgrel=1
pkgdesc="JetBrains Mono NerdFont + LXGW WenKai merged font with 2:1 CJK ratio"
url="https://github.com/lvbibir/JetBrainsLxgwNerdMono"
arch=('any')
license=('OFL-1.1')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/lvbibir/JetBrainsLxgwNerdMono/releases/download/v${pkgver}/JetBrainsLxgwNerdMono.zip"
)
sha256sums=('c371b7d0793cf170a5bf555ebfecbb80d4bee84e668a15d18ddab13bbbfa0c03')

package() {
  local _fontdir="${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 -t "${_fontdir}" \
    "${srcdir}"/JetBrainsLxgwNerdMono/*.ttf
}
