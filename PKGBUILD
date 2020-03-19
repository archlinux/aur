# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

pkgbase=league-fonts
pkgname=(ttf-$pkgbase otf-$pkgbase)
pkgver=20171115
pkgrel=2
pkgdesc='A package depending on all the fonts from The League of Moveable Type'
arch=('any')
url='https://www.theleagueofmoveabletype.com'
license=('OFL')
_fonts=('league-spartan'
        'blackout'
        'linden-hill'
        'raleway'
        'fanwood'
        'sorts-mill-goudy'
        'prociono'
        'chunk'
        'ostrich-sans'
        'junction'
        'league-gothic'
        'league-mono'
        'knewave'
        'league-script'
        'orbitron'
        'goudy-bookletter-1911'
        'sniglet')

package_ttf-league-fonts() {
    depends=("${_fonts[@]/#/ttf-}")
}

package_otf-league-fonts() {
    depends=("${_fonts[@]/#/otf-}")
}
