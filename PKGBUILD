# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-sansita-swashed
pkgver=1.003
pkgrel=3
pkgdesc='Ornate version of Sansita from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/sansita-swashed/'
license=('OFL')
_commit='4b18bac65511ce185c1dc687472a8c77bdc6cc4d'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/otf/SansitaSwashed-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/otf/SansitaSwashed-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/otf/SansitaSwashed-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/otf/SansitaSwashed-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/otf/SansitaSwashed-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/otf/SansitaSwashed-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Sansita-Swashed/${_commit}/fonts/otf/SansitaSwashed-SemiBold.otf")
sha256sums=('e0513f56a7710b94b459ccb7ef77bb7a464e24c777fb2f7023b78af8915dbb86'
            'eed1232ae70fe117059c56a14162869c85b1ebc277c2ff30221016a591bc9496'
            'c1e8dd713e922a7d3be833a7b2a1783ca314811abd838d3fed924abca2ad889f'
            'c9aea651864485223cbe63a6b5585ff1a8b5823cf73f091a0ee6c53bb06b30a5'
            'c103961edf8b3e96b8009242914786d1c77baef03b98523526a83ec19641818d'
            'd1fb836d981ce62f24b9c6ece6e100133f0a5c514253a21188a6eb30d200bc65'
            '57c63932ccf028ca6c3c1e2b7edaa962bf44a56d226ebf3fe6f34353207e2a88'
            'a6be670bce6c2834755b34dec41e1a11e4c64bc5ceff94a60bb510d8e6857d90')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
