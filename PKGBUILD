# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=('ttf-lxgw-neo-zhisong-screen' 'ttf-lxgw-neo-zhisong-screen-full')
pkgver=25.12.31
pkgrel=1
pkgdesc="霞鹜新致宋屏幕阅读版。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiZhi-Screen"
license=('IPA')
source=("${pkgname[0]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreen.ttf"
        "${pkgname[1]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreenFull.ttf"
        LICENSE.md)
sha256sums=('7018671ad06fe156a93e60bd9034af47b184f379cc970c729f7cbae57c34b0c2'
            '7dd0499dbf4917f3464c72a5f9c5392f45482176bbf6edf32c98c5da5c5a5f57'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package_ttf-lxgw-neo-zhisong-screen() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreen.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_ttf-lxgw-neo-zhisong-screen-full() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreenFull.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
