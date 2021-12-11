# Maintainer: Takumi <takuoh qt tutanota d0t com> # please replace q to a , 0 to o
pkgname=ttf-hackgen-nerd
pkgver=2.5.3
pkgrel=1
pkgdesc="HackGen is a composite font of Hack and GenJyuu-Gothic."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("${url}/releases/download/v${pkgver}/HackGenNerd_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE.txt")
sha256sums=('c9393f54bc7704c315b8293244738d014e8b6149090537348b8550d1ef1be254'
            '8ac2fc3472cd8c8c988bbd047a9739f528f614a3e61ff0925e26d2e76e53301d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGenNerd_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

