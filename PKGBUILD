# Maintainer: wyf9661 <wyf9661@gmail.com>
#
# Note: This font is propietary. You'd better purchase it from the official
# website, and this package can not be used for business work.
_pkgbase=otf-operator
pkgname=(${_pkgbase}-{,lig-,ssm-}mono)
pkgver=1.0.0
_basedesc="Operator: the non-typewriter typewriter face"
pkgrel=1
arch=('any')
license=('custom:HCo')
url='https://www.typography.com/fonts/operator/overview/'
_ghurl=("https://github.com/beichensky/Font")
source=("${_pkgbase}-fonts.zip::${_ghurl}/archive/refs/heads/master.zip")
sha1sums=('f8abc06f021d48af59d57f6bd9c17b3d7c7f6e35')

package_otf-operator-mono() {
    pkgdesc=${_basedesc}
    cd Font-master
    # Prepare destination directory
    install -dm 755 "$pkgdir/usr/share/fonts/OTF"

    # Install fonts
    for font in "Operator Mono"; do
        install -Dm644 "./$font/"*.otf -t "$pkgdir/usr/share/fonts/OTF/"
    done
}

package_otf-operator-lig-mono() {
    pkgdesc=${_basedesc}", With ligatures added"
    cd Font-master
    # Prepare destination directory
    install -dm 755 "$pkgdir/usr/share/fonts/OTF"

    # Install fonts
    for font in "Operator Mono Lig"; do
        install -Dm644 "./$font/"*.otf -t "$pkgdir/usr/share/fonts/OTF/"
    done
}

package_otf-operator-ssm-mono() {
    pkgdesc=${_basedesc}", ScreenSmart version"
    cd Font-master
    # Prepare destination directory
    install -dm 755 "$pkgdir/usr/share/fonts/OTF"

    # Install fonts
    for font in "Operator Mono SSm"; do
        install -Dm644 "./$font/"*.otf -t "$pkgdir/usr/share/fonts/OTF/"
    done
}
