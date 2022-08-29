# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-sansita-swashed-variable
pkgver=1.003
pkgrel=2
pkgdesc='Ornate version of Sansita from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/sansita-swashed/'
license=('OFL')
_commit='4b18bac65511ce185c1dc687472a8c77bdc6cc4d'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/vf/SansitaSwashed[wght].ttf")

sha256sums=('e0513f56a7710b94b459ccb7ef77bb7a464e24c777fb2f7023b78af8915dbb86'
            'a6ff6619f22d01eb9582fb00a38052d7afba404ff5868be9bddf37e2888a1c6a')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
