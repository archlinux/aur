# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Meow King <mr.meowking@anche.no>
pkgname="hiddify-next-appimage"
pkgver="0.11.1"
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It’s an open-source, secure and ad-free. "
arch=('any')
url="https://github.com/hiddify/hiddify-next"
license=('custom:CC-BY-NC-SA-4.0')
conflicts=('hiddify-next')
source=("https://github.com/hiddify/hiddify-next/releases/tag/v${pkgver}"
        "LICENSE.md")

package() {
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
