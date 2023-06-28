# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=rej
provides=('rej')
pkgver=0.7
pkgrel=1
pkgdesc='Graphical Java bytecode inspection and manipulation tool'
arch=('any')
license=('LGPLv2.1')
url='https://rejava.sourceforge.net/'
depends=('java-runtime')

source=(
    "https://master.dl.sourceforge.net/project/rejava/reJ/reJ%20v0.7/rej_v0.7_bin.zip"
    "${pkgname}.sh"
    "${pkgname}.desktop"
)

sha256sums=(
    "9aac91c38c23523bc005cab40bef809088bfcd1f3876af6b67333fcc9d95e82a"
    "956e920ba23d7588df23172f29e98089ac9042dc3f8d00a29422c8ec2260f9c5"
    "a253b423b552409518cd2d95907440b0471295bc1beade3701ab4b9123034004"
)

package() {
    install -Dm644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
