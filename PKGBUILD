# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=('ttf-lxgw-neo-zhisong-screen' 'ttf-lxgw-neo-zhisong-screen-full')
pkgver=26.08.21
pkgrel=1
pkgdesc="霞鹜新致宋屏幕阅读版。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiZhi-Screen"
license=('IPA')
source=("${pkgname[0]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreen.ttf"
        "${pkgname[1]}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoZhiSongScreenFull.ttf"
        LICENSE.md)
sha256sums=('4e071b63ee221e72309ec720259f264024336991d1ee0bce42e80d1fb3855a1c'
            '9d0480804b179037e8b50fab8e4e8ec5139d62d233fd2a778905c72e4dc9f417'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package_ttf-lxgw-neo-zhisong-screen() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreen.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_ttf-lxgw-neo-zhisong-screen-full() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/LXGWNeoZhiSongScreenFull.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
