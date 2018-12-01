# Maintainer: Blair Bonnett (blair dot bonnett at gmail dot com)

pkgname=nerd-fonts-noto-sans-mono
pkgver=2.0.0
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
  "91c4f3bc13baed5759e7e937f2b0482fab199fcc25620b16202dd060a9d1e6c1"
  "3651c79217c7f99c8ae787dc4750abf4f31b391ba30631b4d1a97a5f93a4ee7c"
  "d7fcfe8defe56fc5b121f432386704545a12fa89a364bb3cc94dc943078d8178"
  "0d93469c1ab805a254198981d37ad08ce9a3404378fccfd23817e47f186b586f"
  "58fc56cf7c1ee12b831670901620cc8591f8e2a3fa74d3c03257cd99dbe6563c"
  "f310f1774d3530fc497de334d7050b24751f4e114c4dad9772c98c9290a23951"
  "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5"
)

package (){
  install -dm0755 "$pkgdir"/usr/share/fonts/TTF
  install -Dm0644 "$srcdir"/*.ttf "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/nerd-fonts-noto-sans-mono
}
