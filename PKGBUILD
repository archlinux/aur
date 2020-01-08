# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=ttf-pingfang
pkgver=0.1.0
pkgrel=1
pkgdesc="PingFang font from Apple"
arch=('any')
license=('custom')
depends=(fontconfig)
source=(
        file://PingFangHK-Light.otf
        file://PingFangHK-Medium.otf
        file://PingFangHK-Regular.otf
        file://PingFangHK-Semibold.otf
        file://PingFangHK-Thin.otf
        file://PingFangHK-Ultralight.otf
        file://PingFangSC-Light.otf
        file://PingFangSC-Medium.otf
        file://PingFangSC-Regular.otf
        file://PingFangSC-Semibold.otf
        file://PingFangSC-Thin.otf
        file://PingFangSC-Ultralight.otf
        file://PingFangTC-Light.otf
        file://PingFangTC-Medium.otf
        file://PingFangTC-Regular.otf
        file://PingFangTC-Semibold.otf
        file://PingFangTC-Thin.otf
        file://PingFangTC-Ultralight.otf
)
md5sums=('e45fc80b8cf1fbff30e10c5281d5af2b'
         '6051b8a05caaceaba151d370c18bf905'
         'fb9d38d6347e08c17c16a31f464b1718'
         '06090013a455f7f75343d05c92cb1a5a'
         '07d8133da2a546810df5b0aba1eaefc7'
         'fa738ffc85869ad5bd36c03d47c4abd1'
         'f8202c15daba6209293e24e9e50d8b6a'
         'bb87a7095cf065ab9e6b7a15478ed4a6'
         'c91f4a7ea00a17d4f6f601f12ff97670'
         '3be88af38ca096e6a0fc19aa7c804e56'
         '91e6318f109e09d7bbf135e68d7c99c0'
         '76fcf13df9fcb0c1127dfe0ef99668c0'
         '2d39d32f09ef1fac1bc9c85ebe359b6a'
         'b1a1a093a00adcb41b32e75b64ba8869'
         '01a33436b9561417e3d3ccf248d0201c'
         'e8917c000513562400f35428647a8b18'
         'eff0bdd56dab23594225bfcb617a0808'
         'f6d22cabdb65cf14eb5a9c5ac2df79a0')


package () {
  mkdir -p "${pkgdir}/usr/share/fonts/apple"
  install -Dm644 PingFang* "${pkgdir}/usr/share/fonts/apple"
}
