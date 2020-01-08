# Maintainer: Poscat <poscat@mail.poscat.moe>
pkgname=ttf-pingfang
pkgver=0.1.0
pkgrel=1
pkgdesc="PingFang font from Apple"
arch=('any')
license=('custom')
depends=(fontconfig)
source=(file://PingFangHK-Light.otf
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
        file://PingFangTC-Ultralight.otf)
md5sums=('1b216dabee374d3601338d3eadea7d65'
         'aa724cf6c77ae049d24e107073c3041a'
         'd643b097e8a6ed82331802843bec1e44'
         'fe53c7ee552dcced43a657973a064450'
         '3611d5fe1c491deaa443a8f5699900a5'
         'aeabbdf2c1e2d4d0a142753151232536'
         '9d40f7d4095cb47e58e71d62581ddb53'
         'f1fe3354fa80388b506e2776e9a445d1'
         'ae237eff9fcf1d454c46ae82cedc889f'
         '39b5f04c0934a43eb785c2083f864312'
         'fe5ccf78fb165f3239a65f5fafe711f4'
         '2d4ffa93b2b318d242944ec2b9901e3f'
         '99d06a5786d4db200fc2a1e091553f09'
         'e8286f573f04c97ddd4c7e52272a00d0'
         '8cc20e46ab8ea428610d4dc33b3eaa3f'
         'a49828fdab08f29d1696e1636c3e5c56'
         '31d83d7763457fc7c9802396116dac00'
         'f3230884db32390651b31568b2ad751b')


package () {
  mkdir -p "${pkgdir}/usr/share/fonts/apple"
  install -Dm644 PingFang* "${pkgdir}/usr/share/fonts/apple"
}
