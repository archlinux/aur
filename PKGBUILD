# Maintainer: Jose Riha <jose1711 gmail com>
_pkgname=slabikar
pkgname=latex-${_pkgname}-font
pkgver=2
pkgrel=3
pkgdesc="Handwritten Czech/Slovak font slabikar"
arch=('any')
url="http://petr.olsak.net/ftp/olsak/slabikar/"
license=('LicenseRef-slabikar')
depends=('texlive-basic')
install="${pkgname}.install"
_base_url="http://petr.olsak.net/ftp/olsak/slabikar/"
source=("${_base_url}README"
        "${_base_url}slabi.pdf"
        "${_base_url}slabi.tex"
        "${_base_url}slabikar.mf"
        "${_base_url}slabikar.pfb"
        "${_base_url}slabikar.tfm"
        "${_base_url}ukazka.tex"
        )


package() {
    cd $srcdir
    install -Dm644 slabikar.mf ${pkgdir}/usr/share/texmf-dist/fonts/source/public/${_pkgname}/slabikar.mf
    install -Dm644 slabikar.tfm ${pkgdir}/usr/share/texmf-dist/fonts/tfm/public/${_pkgname}/slabikar.tfm
    install -Dm644 slabikar.pfb ${pkgdir}/usr/share/texmf-dist/fonts/type1/public/${_pkgname}/slabikar.pfb
    install -d ${pkgdir}/usr/share/doc/${_pkgname}
    install -Dm644 ukazka.tex slabi.pdf README ${pkgdir}/usr/share/doc/${_pkgname}/
    install -Dm644 README ${pkgdir}/usr/share/licenses/${pkgname}/README
}
md5sums=('21348e16f061f93d6da1ddd4725730c5'
         'a88d137e93bde8f82fd906d16e5e7bf7'
         '2e90a35b1ad670787d4b08bb76f1fbd4'
         'a3de7b231767f054bad252f6726ae99c'
         '05667023b7d9257fbdc8b5a47638a4a7'
         '35cd6adfa711a91d25edd6c12449ce7b'
         'b6477d47702a83388d2fde37a8008054')
