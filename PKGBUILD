# Maintainer: orumin <dev@orum.in>

pkgname=sound-theme-sakura
pkgver=1.0
pkgrel=4
pkgdesc="Sound theme for Linux desktop made by Japanimation voice actor 'MURAKAWA Rie' and Linux-HA JAPAN. This is made for cheering Pacemaker"
arch=('any')
url="http://linux-ha.osdn.jp/wp/archives/212"
license=('custom')
source=("LICENSE.txt"
        "https://oss-ch.info/data/sakura-thema.tar.gz")
md5sums=('d26693af2e51fc2d4107a1510d3a7153'
         'eb0f67d74dbf92e45c65f7e5bcb8be7e')

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/share/sounds"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r ./sakura "${pkgdir}/usr/share/sounds/"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
