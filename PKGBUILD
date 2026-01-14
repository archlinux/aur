# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=('ttf-lxgw-neo-zhisong-screen' 'ttf-lxgw-neo-zhisong-screen-full')
pkgver=26.01.14
pkgrel=1
pkgdesc="霞鹜新致宋屏幕阅读版。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiZhi-Screen"
license=('IPA')
source=("${pkgname[0]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreen.ttf"
        "${pkgname[1]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreenFull.ttf"
        LICENSE.md)
sha256sums=('769011e8b7b5efa93b9097de9fe2c55adbcc33fbf20bfa622b9521fd3cb984e4'
            'e63ccab998535645bba38bc5c7667a9793bbd6c48c315e732c084b065c6b4bdb'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package_ttf-lxgw-neo-zhisong-screen() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreen.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_ttf-lxgw-neo-zhisong-screen-full() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreenFull.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
