# Contributor: orumin <dev@orum.in>

pkgname=tex-adobe-base-14-fonts
pkgver=1.00
pkgrel=1
pkgdesc="change some of system to using adobe base 14 fonts in TeXLive"
url=""
install=mktexlsr.install
license=('custom')
arch=('any')
dpeendes=('texlive-core' 'adobe-base-14-fonts')

package() {
    install -d "${pkgdir}/usr/local/share/texmf/fonts/type1/adobe"
    cd "${pkgdir}/usr/local/share/texmf/fonts/type1/adobe"

    install -d "${pkgdir}/usr/local/share/texmf/fonts/type1/adobe/courier"
    cd courier
    find /usr/share/fonts/Type1/ -name 'pcr*.pfb' -exec ln -s {} \;
    cd ../

    install -d "${pkgdir}/usr/local/share/texmf/fonts/type1/adobe/helvetic"
    cd helvetic
    find /usr/share/fonts/Type1/ -name 'phv*.pfb' -exec ln -s {} \;
    cd ../

    install -d "${pkgdir}/usr/local/share/texmf/fonts/type1/adobe/symbol"
    cd symbol
    find /usr/share/fonts/Type1/ -name 'psy*.pfb' -exec ln -s {} \;
    cd ../

    install -d "${pkgdir}/usr/local/share/texmf/fonts/type1/adobe/times"
    cd times
    find /usr/share/fonts/Type1/ -name 'ptm*.pfb' -exec ln -s {} \;
    cd ../

    install -d "${pkgdir}/usr/local/share/texmf/fonts/type1/adobe/zapfding"
    cd zapfding
    find /usr/share/fonts/Type1/ -name 'pzd*.pfb' -exec ln -s {} \;
    cd ../

}
