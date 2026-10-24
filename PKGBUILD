# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgbase=ttf-kreativekorp-lisa
pkgname=(
    'ttf-kreativekorp-lisa-emptyfolders'
    'ttf-kreativekorp-lisa-engelbart'
    'ttf-kreativekorp-lisa-calc'
    'ttf-kreativekorp-lisa-graph'
    'ttf-kreativekorp-lisa-guide'
    'ttf-kreativekorp-lisa-project'
    'ttf-kreativekorp-lisa-sketch'
    'ttf-kreativekorp-lisa-terminal'
    'ttf-kreativekorp-lisa-priamwhamos'
    'ttf-kreativekorp-lisa-someacronym'
    'ttf-kreativekorp-lisa-startupfrom'
    'ttf-kreativekorp-lisa-twiggy'
)
pkgver=2011.02
pkgrel=1
pkgdesc="KreativeKorp's Apple Lisa font bundle: Empty Folders, Engelbart, Paper (LisaCalc, LisaGraph, LisaGuide, LisaProject, LisaSketch, LisaTerminal), Priam Whamos, Some Acronym, Startup From, and Twiggy, in 2 variations each."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/retro/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

# Patch taken from 'ttf-petme'.
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=(
    'lisa1.zip::https://www.kreativekorp.com/swdownload/fonts/retro/lisa1.zip'
)
sha256sums=(
    '5e36ccf1ba63107c5eded2344cb5f74b7b82da2ceb40abf9314fe80c7b2effd6'
)

package_ttf-kreativekorp-lisa-emptyfolders() {
    pkgdesc="KreativeKorp's Lisa font from WMFONT: Empty Folders."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'EmptyFolders*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-engelbart() {
    pkgdesc="KreativeKorp's Lisa font from SYSCURSOR: Engelbart."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'Engelbart*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-calc() {
    pkgdesc="KreativeKorp's Lisa font from CALCFONT: LisaCalc Paper."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'LisaCalcPaper*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-graph() {
    pkgdesc="KreativeKorp's Lisa font from MARKER: LisaGraph Paper."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'LisaGraphPaper*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-guide() {
    pkgdesc="KreativeKorp's Lisa font from IMGRAPH: LisaGuide Paper."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'LisaGuidePaper*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-project() {
    pkgdesc="KreativeKorp's Lisa font from TOOLKIT: LisaProject Paper."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'LisaProjectPaper*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-sketch() {
    pkgdesc="KreativeKorp's Lisa font from SYSPAT: LisaSketch Paper."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'LisaSketchPaper*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-terminal() {
    pkgdesc="KreativeKorp's Lisa font from TILE*VT: LisaTerminal Paper."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'LisaTerminalPaper*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-priamwhamos() {
    pkgdesc="KreativeKorp's Lisa font from ICONFONT: Priam Whamos."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'PriamWhamos*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-someacronym() {
    pkgdesc="KreativeKorp's Lisa font from HELV7RP: Some Acronym."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'SomeAcronym*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-startupfrom() {
    pkgdesc="KreativeKorp's Lisa font from ROM/Workshop: Startup From."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'StartupFrom*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-twiggy() {
    pkgdesc="KreativeKorp's Lisa font from SYSTEXT: Twiggy."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'Twiggy*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

