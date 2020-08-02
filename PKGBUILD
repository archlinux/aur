# Maintainer: Jose Riha <jose1711 gmail com>
_pkgname=slabikar
pkgname=latex-${_pkgname}-font
pkgver=2
pkgrel=1
pkgdesc="Handwritten Czech/Slovak font slabikar"
arch=('any')
url="http://petr.olsak.net/ftp/olsak/slabikar/"
license=('LPPL')
depends=('texlive-core')
install="${pkgname}.install"
base_url="http://petr.olsak.net/ftp/olsak/slabikar/"
source=("${base_url}README"
        "${base_url}slabi.pdf"
        "${base_url}slabi.tex"
        "${base_url}slabikar.mf"
        "${base_url}slabikar.pfb"
        "${base_url}slabikar.tfm"
        "${base_url}ukazka.tex"
        )


package() {
    cd $srcdir
    install -Dm644 slabikar.mf ${pkgdir}/usr/share/texmf-dist/fonts/source/public/${_pkgname}/slabikar.mf
    install -Dm644 slabikar.tfm ${pkgdir}/usr/share/texmf-dist/fonts/tfm/public/${_pkgname}/slabikar.tfm
    install -Dm644 slabikar.pfb ${pkgdir}/usr/share/texmf-dist/fonts/type1/public/${_pkgname}/slabikar.pfb
    install -d ${pkgdir}/usr/share/doc/${_pkgname}
    install -Dm644 ukazka.tex slabi.pdf README ${pkgdir}/usr/share/doc/${_pkgname}/
}
md5sums=('41593108e2283ea64c035892833bfb0e'
         'a88d137e93bde8f82fd906d16e5e7bf7'
         '2e90a35b1ad670787d4b08bb76f1fbd4'
         'a3de7b231767f054bad252f6726ae99c'
         '05667023b7d9257fbdc8b5a47638a4a7'
         '35cd6adfa711a91d25edd6c12449ce7b'
         'b6477d47702a83388d2fde37a8008054')
