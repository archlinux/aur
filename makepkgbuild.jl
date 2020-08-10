using SHA

commit="3e9bd602b89ecd377f536007e8fdd75b80e01d60"
baseurl = "https://github.com/cormullion/juliamono/raw/"

fontnames = ["JuliaMono-Black", "JuliaMono-Bold", "JuliaMono-ExtraBold", "JuliaMono-Light", "JuliaMono-Medium", "JuliaMono-Regular"]

version = "0.006"


pkgbuild = raw"""
# Maintainer: Bart Janssens <bart at bartjanssens dot org>

pkgname=ttf-juliamono
_commit='__COMMIT'
pkgver=__VERSION
pkgrel=1
pkgdesc='JuliaMono is a monospace typeface designed for programming in Julia.'
arch=('any')
url='https://juliamono.netlify.app/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
"""

source="source=("
sha256sums="sha256sums=("
package = raw"""package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
"""

mktempdir() do d
    for (i,fontname) in enumerate(fontnames)
        sourceprefix = i != 1 ? "        " : ""
        shaprefix = i != 1 ? "            " : ""
        global source *= "$sourceprefix\"$fontname-\${pkgver}.ttf::$baseurl/\${_commit}/$fontname.ttf\"\n"
        fname = download("$baseurl$commit/$fontname.ttf")
        open(fname) do fontfile
            global sha256sums *= "$shaprefix\'$(bytes2hex(sha256(fontfile)))\'\n"
        end
        global package *= "  install -m 644 $fontname-\${pkgver}.ttf \"\${pkgdir}/usr/share/fonts/TTF/$fontname.ttf\"\n"
    end
    fname = download("$baseurl$commit/LICENSE")
    open(fname) do licfile
        global sha256sums *= "            \'$(bytes2hex(sha256(licfile)))\')"
    end
    global source *= "        \"\${pkgname}-\${pkgver}-OFL.txt::$baseurl/\${_commit}/LICENSE\")"
end

package *= raw"""  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
"""

pkgbuild *= source * "\n" * sha256sums * "\n\n" * package
pkgbuild = replace(pkgbuild, "__COMMIT" => commit)
pkgbuild = replace(pkgbuild, "__VERSION" => version)

open("PKGBUILD", "w") do outfile
    write(outfile, pkgbuild)
end
