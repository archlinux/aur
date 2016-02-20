# Maintainer: orumin <dev@orum.in>

pkgname=sound-theme-kayo
pkgver=1.0
pkgrel=1
pkgdesc="Sound theme for Linux desktop made by Japanimation voice actor 'TANGE Sakura' and Linux-HA JAPAN."
arch=('any')
url="http://linux-ha.osdn.jp/wp/archives/212"
license=('custom')
source=("LICENSE.txt"
        "http://www.oss-ch.jp/data/kayo-thema.tar.gz")
md5sums=('d26693af2e51fc2d4107a1510d3a7153'
         '245246b02dc5bc22f62e22c256f49445')

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/share/sounds"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r ./kayo "${pkgdir}/usr/share/sounds/"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
