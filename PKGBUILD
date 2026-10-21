# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgbase=ttf-kreativekorp-apple2
pkgname=('ttf-kreativekorp-apple2-pr' 'ttf-kreativekorp-apple2-shaston' 'ttf-kreativekorp-apple2-berkeliumii' 'ttf-kreativekorp-apple2-bload')
pkgver=2020.04
pkgrel=1
pkgdesc="KreativeKorp's Apple II-themed font bundle: Print Char 21, PR Number 3, Shaston, Berkelium II, and BLoad, with their respective variations."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/apple2/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

source=(
    'pr.zip::https://www.kreativekorp.com/swdownload/fonts/retro/pr.zip'
    'shaston.zip::https://www.kreativekorp.com/swdownload/fonts/retro/shaston.zip'
    'berkeliumii.zip::https://www.kreativekorp.com/swdownload/fonts/retro/berkeliumii.zip'
    'bload.zip::https://www.kreativekorp.com/swdownload/fonts/retro/bload.zip'
)
sha256sums=(
    '39020933a8f1b5bf2869835fb8d2a4a9e134912ff128a12a8cc4162639a20aec'
    '5d732d6c283905fecb5eb177267d144906acabf5d309b29b9456858c01231ab4'
    '46e35f90318969b495b74329cbbc1fc1fd5008a4f92d9f583f207e462c265ccc'
    '0d87ff9408e7172038fe88a6ce3128af8cb716d5bce4a92cf7a33cd9b7458dd4'
)

package_ttf-kreativekorp-apple2-pr() {
    pkgdesc="KreativeKorp's Apple II standard font: Print Char 21, and PR Number 3."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -iname 'PR*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-apple2-shaston() {
    pkgdesc="KreativeKorp's Apple II GS/OS system font: Shaston, in 4 different variants."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'Shaston*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-apple2-berkeliumii() {
    pkgdesc="KreativeKorp's Apple II GEOS system font: Berkelium II, in 2 different variants."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'BerkeliumII*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-apple2-bload() {
    pkgdesc="KreativeKorp's Apple II standard bit patterns fonts: BLoad A1024 (lo-res graphics), and BLoad A8192 (hi-res graphics)."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'BLoad*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

