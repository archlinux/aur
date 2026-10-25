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
pkgrel=2
pkgdesc="KreativeKorp's Apple Lisa font bundle: Empty Folders, Engelbart, Paper (LisaCalc, LisaGraph, LisaGuide, LisaProject, LisaSketch, LisaTerminal), Priam Whamos, Some Acronym, Startup From, and Twiggy, in 2 variations each."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/retro/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'lisa1.zip::https://www.kreativekorp.com/swdownload/fonts/retro/lisa1.zip'
)
sha256sums=(
    '5e36ccf1ba63107c5eded2344cb5f74b7b82da2ceb40abf9314fe80c7b2effd6'
)

_install_font() {
    local fontspec="$1"
    
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -name "${fontspec}" \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-lisa-emptyfolders() {
    pkgdesc="KreativeKorp's Lisa font from WMFONT: Empty Folders."

    _install_font 'EmptyFolders*.ttf'
}

package_ttf-kreativekorp-lisa-engelbart() {
    pkgdesc="KreativeKorp's Lisa font from SYSCURSOR: Engelbart."

    _install_font 'Engelbart*.ttf'
}

package_ttf-kreativekorp-lisa-calc() {
    pkgdesc="KreativeKorp's Lisa font from CALCFONT: LisaCalc Paper."

    _install_font 'LisaCalcPaper*.ttf'
}

package_ttf-kreativekorp-lisa-graph() {
    pkgdesc="KreativeKorp's Lisa font from MARKER: LisaGraph Paper."

    _install_font 'LisaGraphPaper*.ttf'
}

package_ttf-kreativekorp-lisa-guide() {
    pkgdesc="KreativeKorp's Lisa font from IMGRAPH: LisaGuide Paper."

    _install_font 'LisaGuidePaper*.ttf'
}

package_ttf-kreativekorp-lisa-project() {
    pkgdesc="KreativeKorp's Lisa font from TOOLKIT: LisaProject Paper."

    _install_font 'LisaProjectPaper*.ttf'
}

package_ttf-kreativekorp-lisa-sketch() {
    pkgdesc="KreativeKorp's Lisa font from SYSPAT: LisaSketch Paper."

    _install_font 'LisaSketchPaper*.ttf'
}

package_ttf-kreativekorp-lisa-terminal() {
    pkgdesc="KreativeKorp's Lisa font from TILE*VT: LisaTerminal Paper."

    _install_font 'LisaTerminalPaper*.ttf'
}

package_ttf-kreativekorp-lisa-priamwhamos() {
    pkgdesc="KreativeKorp's Lisa font from ICONFONT: Priam Whamos."

    _install_font 'PriamWhamos*.ttf'
}

package_ttf-kreativekorp-lisa-someacronym() {
    pkgdesc="KreativeKorp's Lisa font from HELV7RP: Some Acronym."

    _install_font 'SomeAcronym*.ttf'
}

package_ttf-kreativekorp-lisa-startupfrom() {
    pkgdesc="KreativeKorp's Lisa font from ROM/Workshop: Startup From."

    _install_font 'StartupFrom*.ttf'
}

package_ttf-kreativekorp-lisa-twiggy() {
    pkgdesc="KreativeKorp's Lisa font from SYSTEXT: Twiggy."

    _install_font 'Twiggy*.ttf'
}

