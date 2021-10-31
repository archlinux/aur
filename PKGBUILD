# Maintainer: Niklas Leinz <niklas[at]corusm[dot]de>
pkgname="mouselogger"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="MouseLogger for University DataScience Project"
arch=("any")
url="https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App"
license=("MIT")
source=("https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App")
sha512sums=("SKIP")


package() {
    # Package
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/../bin/mouselogger" "${pkgdir}/usr/bin/mouselogger"
    chmod +x "${pkgdir}/usr/bin/mouselogger"

    # Install Desktop File
    install -Dm644 "${srcdir}/../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install Icon File
    install -Dm644 "${srcdir}/../mouselogger.png" "$pkgdir/usr/share/applications/$pkgname.png"
}