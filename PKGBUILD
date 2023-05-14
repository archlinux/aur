pkgname="wf-shadow"
pkgver="1.4.2"
pkgrel="1"
pkgdesc="Script to make instant-replay easy on wl-roots based compositors"
arch=("x86_64" "arm")
depends=("wofi" "wf-recorder" "bash")
license=("GPL3+")
source=("https://codeberg.org/cobra/wf-shadow/raw/tag/v${pkgver}/wf-shadow" "https://codeberg.org/cobra/wf-shadow/raw/tag/v${pkgver}/doc/wf-shadow.1")
sha512sums=("SKIP" "SKIP")
package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/wf-shadow" "${pkgdir}/usr/bin/wf-shadow"
    chmod +x "${pkgdir}/usr/bin/wf-shadow"

    install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
