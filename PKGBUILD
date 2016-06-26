# Contributor: orumin <dev@orum.in>

# notice:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# You can download MathTime Pro2 Lite font below:
#
# http://www2.pctex.com/downloads.php?product=MTP2L
#
# if you have done downloaded, mtp2lite.zip.tpm place same as this PKGBUILD directory
# Then, uncomment source and md5sums

pkgname=tex-math-time-pro2-lite
pkgver=1.000
pkgrel=1
pkgdesc="TeX math commercial font (free version)"
url="http://www.pctex.com/mtpro2.html"
license=('custom')
arch=('any')
dpeendes=('texlive-core')
install=mtp2lite.install
#source=("mtp2lite.zip.tpm")
#md5sums=('278045b67872ffab6767efff3f58c7ad')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/local/share/"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 EULA-MTPro2Lite.txt "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r texmf "${pkgdir}"/usr/local/share/
}
