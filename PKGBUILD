# Maintainer: A. Husen <hello@husen.id>
pkgname=nonicons-font
pkgver=r27.2f0a7e2
pkgrel=1
pkgdesc="A set of SVG icons representing programming languages, designing & development tools."
arch=('any')
url="https://github.com/yamatsum/nonicons"
license=('unknown')
source=("${url}/raw/master/dist/nonicon.ttf")
sha512sums=("595d20985d9eaf9fa6a44a005f25e1e5710f138831008836e925ace1c70ef93c75578377948f671578a80a5f3ab5806c4cdca9866589b97d75c19913f08962f5")

package() {
    install -dm755 "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
