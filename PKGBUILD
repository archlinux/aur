# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=jetbrains-lxgw-nerd-mono-ttf
pkgver=1.3
pkgrel=2
pkgdesc="JetBrains Mono NerdFont + LXGW WenKai merged font with 2:1 CJK ratio"
url="https://github.com/lvbibir/JetBrainsLxgwNerdMono"
arch=('any')
license=('OFL-1.1')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/lvbibir/JetBrainsLxgwNerdMono/releases/download/v${pkgver}/JetBrainsLxgwNerdMono.zip"
  'OFL-JetBrainsMono.txt::https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/OFL.txt'
  'OFL-LXGWWenKai-Screen.txt::https://raw.githubusercontent.com/lxgw/LxgwWenKai-Screen/main/OFL.txt'
  'OFL-LXGWZhenKai.txt::https://raw.githubusercontent.com/lxgw/LxgwZhenKai/main/OFL.txt'
)
sha256sums=(
  'c371b7d0793cf170a5bf555ebfecbb80d4bee84e668a15d18ddab13bbbfa0c03'
  'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
  'ba38832f9d7e0ad601a1ab90d58f251ba957532885ef80dca050a611962fd8b6'
  '1ee66a22ddfa5241d407a5fd9a2ba666c4de5700f17182d5ee729e0434e7b42d'
)

package() {
  local _fontdir="${pkgdir}/usr/share/fonts/TTF"
  local _licensedir="${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 -t "${_fontdir}" \
    "${srcdir}"/JetBrainsLxgwNerdMono/*.ttf
  install -Dm644 -t "${_licensedir}" \
    "${srcdir}/OFL-JetBrainsMono.txt" \
    "${srcdir}/OFL-LXGWWenKai-Screen.txt" \
    "${srcdir}/OFL-LXGWZhenKai.txt"
}
