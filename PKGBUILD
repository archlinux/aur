# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=('ttf-lxgw-neo-zhisong-screen' 'ttf-lxgw-neo-zhisong-screen-full')
pkgver=26.06.20
pkgrel=1
pkgdesc="霞鹜新致宋屏幕阅读版。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiZhi-Screen"
license=('IPA')
source=("${pkgname[0]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreen.ttf"
        "${pkgname[1]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreenFull.ttf"
        LICENSE.md)
sha256sums=('86dd7244c17433704280a1f1aad978e06b5fea4b5d5eb1cbc70337e979224a81'
            '5e60e82cd7dddda6605b8d29f73cbfe52523262bd656b4339232b287c5b66294'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package_ttf-lxgw-neo-zhisong-screen() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreen.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_ttf-lxgw-neo-zhisong-screen-full() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreenFull.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
