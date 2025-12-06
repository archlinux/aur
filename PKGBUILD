# Maintainer: myt <myt@qq.com>

pkgname=plasma-weather-plus
pkgver=4.4.3
pkgrel=1
epoch=1
pkgdesc='plasma天气插件'
arch=('any')
url='https://github.com/tully-t/weather-widget-plus'
license=('custom')
depends=()
source=(git+${url}.git)
sha512sums=(SKIP)
package() {
    cd "${srcdir}/weather-widget-plus"
    sh translations/po/build.sh
    install -m755 -d "${pkgdir}/usr/share/plasma/plasmoids/weather.widget.plus"
    cp -r weather.widget.plus/* ${pkgdir}/usr/share/plasma/plasmoids/weather.widget.plus/
}

