# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgbase=ttf-kreativekorp-trs80
pkgname=('ttf-kreativekorp-trs80-model1-original' 'ttf-kreativekorp-trs80-model1-lowercase' 'ttf-kreativekorp-trs80-model3' 'ttf-kreativekorp-trs80-model4-original' 'ttf-kreativekorp-trs80-model4-intl')
pkgver=2014.04
pkgrel=1
pkgdesc="KreativeKorp's font bundle themed after the TRS-80: Another Man's Treasure, complete with 22 different variations!"
arch=('any')
url='https://www.kreativekorp.com/software/fonts/trs80/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

# Patch taken from 'ttf-petme'.
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=(
    'amtreasure.zip::https://www.kreativekorp.com/swdownload/fonts/retro/amtreasure.zip'
)
sha256sums=(
    '0ead11c7c07fd3306bc001a393088b973497ad1dad52bdc418c31da5881031e4'
)

package_ttf-kreativekorp-trs80-model1-original() {
    pkgdesc="KreativeKorp's TRS-80 original Model 1 (I) font: Another Man's Treasure MIA."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'AnotherMansTreasureMIA*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-trs80-model1-lowercase() {
    pkgdesc="KreativeKorp's TRS-80 lowercase Model 1 (I) font: Another Man's Treasure MIB."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'AnotherMansTreasureMIB*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-trs80-model3() {
    pkgdesc="KreativeKorp's TRS-80 Model 3 (III) font: Another Man's Treasure MIII."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'AnotherMansTreasureMIII*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-trs80-model4-original() {
    pkgdesc="KreativeKorp's TRS-80 original Model 4 font: Another Man's Treasure M4A."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'AnotherMansTreasureM4A*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-trs80-model4-intl() {
    pkgdesc="KreativeKorp's TRS-80 international Model 4 font: Another Man's Treasure M4B."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'AnotherMansTreasureM4B*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

