# Maintainer: Blair Bonnett (blair dot bonnett at gmail dot com)

pkgname=nerd-fonts-noto-sans-mono
pkgver=2.1.0
pkgrel=1
pkgdesc="Standard variants of Noto Sans Mono patched with Nerd Fonts."
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')

_base_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/patched-fonts/Noto/Sans-Mono/complete/Noto%20Sans%20Mono%20"
source=(
  "NotoSansMono-Black-Nerd-Font-Complete.ttf::${_base_url}Black%20Nerd%20Font%20Complete.ttf"
  "NotoSansMono-Bold-Nerd-Font-Complete.ttf::${_base_url}Bold%20Nerd%20Font%20Complete.ttf"
  "NotoSansMono-Light-Nerd-Font-Complete.ttf::${_base_url}Light%20Nerd%20Font%20Complete.ttf"
  "NotoSansMono-Medium-Nerd-Font-Complete.ttf::${_base_url}Medium%20Nerd%20Font%20Complete.ttf"
  "NotoSansMono-Regular-Nerd-Font-Complete.ttf::${_base_url}Regular%20Nerd%20Font%20Complete.ttf"
  "NotoSansMono-Thin-Nerd-Font-Complete.ttf::${_base_url}Thin%20Nerd%20Font%20Complete.ttf"
  "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/${pkgver}/LICENSE"
)
sha256sums=(
  '127cb2808406be0b79cc5f9401741f6e87d38088f409dfa605451f3f6e950d37'
  'df9e648e03094ba6d6e044a846f760130eea28c37d6280835a29d28fb939d23d'
  'b270b5cc71cca25e17b6b3635caa4c5db5dec59a9bc4b72f1ac61cd1a54069f7'
  '545806cf022c0708725f3c9493796bbfe8bcbdd98259ce0f1ecc35fd466a6823'
  '25d52eaee055be6df2836097b8230f989d82260fe9e6cdd21daa12c5e26211e6'
  'dc7bb09cabc260bb4740831aa6f75a373a114be7a164f9d1e96b0f493e930a79'
  'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5'
)

package (){
  install -dm0755 "$pkgdir"/usr/share/fonts/TTF
  install -Dm0644 "$srcdir"/*.ttf "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/nerd-fonts-noto-sans-mono
}
