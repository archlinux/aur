# Maintainer: orumin <dev@orum.in>

pkgname=sound-theme-kayo
pkgver=1.0
pkgrel=3
pkgdesc="Sound theme for Linux desktop made by Japanimation voice actor 'TANGE Sakura' and Linux-HA JAPAN. This is made for cheering Pacemaker"
arch=('any')
url="http://linux-ha.osdn.jp/wp/archives/212"
license=('custom')
source=("LICENSE.txt"
        "https://oss-ch.info/data/kayo-thema.tar.gz")
md5sums=('d26693af2e51fc2d4107a1510d3a7153'
         '245246b02dc5bc22f62e22c256f49445')

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/share/sounds"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r ./kayo "${pkgdir}/usr/share/sounds/"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
