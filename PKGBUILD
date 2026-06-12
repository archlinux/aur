# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>

pkgname=ttf-shippori-mincho
pkgver=3.000
pkgrel=1
pkgdesc="Japanese old-style Mincho fonts, including the standard and B1 families"
arch=('any')
url="https://github.com/fontdasu/ShipporiMincho"
license=('OFL-1.1')
conflicts=('otf-shippori-mincho')
_commit=63431fee6c2cfea772325d6251d2935b7cfa7c6d
source=(
  "ShipporiMincho-Bold.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMincho-Bold.ttf"
  "ShipporiMincho-ExtraBold.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMincho-ExtraBold.ttf"
  "ShipporiMincho-Medium.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMincho-Medium.ttf"
  "ShipporiMincho-Regular.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMincho-Regular.ttf"
  "ShipporiMincho-SemiBold.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMincho-SemiBold.ttf"
  "ShipporiMinchoB1-Bold.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMinchoB1-Bold.ttf"
  "ShipporiMinchoB1-ExtraBold.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMinchoB1-ExtraBold.ttf"
  "ShipporiMinchoB1-Medium.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMinchoB1-Medium.ttf"
  "ShipporiMinchoB1-Regular.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMinchoB1-Regular.ttf"
  "ShipporiMinchoB1-SemiBold.ttf::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/fonts/ttf/ShipporiMinchoB1-SemiBold.ttf"
  "OFL.txt::https://raw.githubusercontent.com/fontdasu/ShipporiMincho/${_commit}/OFL.txt"
)
sha256sums=('be85eeed197f573a8d8dcb26634787179574f3ff179afef077ecfb8d81daa20f'
            '42cfb94dd71f3df2afb83885aa85947d5dd056fad351bb7ff43989f811086b31'
            '8b53605be22878c04503bd9337cd72e5d4da186cc9aa7b26a666e702e21cf809'
            '743f95a923387d9c5d0709b08e98adf706f871bfa7ccaa21ebdf5526ba080476'
            'e456758717f712507419e35ba766c1fdb9c4ba073daef6c2c469726bee22b05d'
            '1d90573ab8859fcb5fee54a485f5e359f3eed6e16476b8fc0b86dd82130b6000'
            'f17b9e99b5aec7beca1be9a5914ea57f53c18d82c3010b1d11526bc06d566013'
            '1168dc04ebf8c1df50836dabf2269edb1acd4f17cc748dd3c987ae6a65ee7478'
            '8ff7ce714dfd325035f924af6d1632acd753099dddbc869722ac24f68924d944'
            '0f8a7dffe37e4bbe18908304f7d28b76e775d82cac02c79da21a62a078c88900'
            '41fba056279be5f45ff9a99e44b7b53897b42732f5806d8e666e0ab49ac6bd38')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" ./*.ttf
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
