# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=('ttf-lxgw-neo-zhisong-screen' 'ttf-lxgw-neo-zhisong-screen-full')
pkgver=25.09.08
pkgrel=1
pkgdesc="霞鹜新致宋屏幕阅读版。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiZhi-Screen"
license=('IPA')
source=("${pkgname[0]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreen.ttf"
        "${pkgname[1]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreenFull.ttf"
        LICENSE.md)
sha256sums=('4eeae8350c616f64cd07898df7a1b2147973610d025284f4f066c09a3bb62b7e'
            '6381f6cfda8922ab4349a05906f5ee13b7b2013d78652a33787e82ca250170e6'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package_ttf-lxgw-neo-zhisong-screen() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreen.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_ttf-lxgw-neo-zhisong-screen-full() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreenFull.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
