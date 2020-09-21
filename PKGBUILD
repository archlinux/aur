# Maintainer: Tommy Karkay Afik <tommyka03@gmail.com>

pkgname=ttf-miriam-libre
pkgver=1.0
pkgrel=1
pkgdesc='Miriam Libre is a mono-linear Hebrew and Latin sans serif font family.'
arch=('any')
url='https://fonts.google.com/specimen/Miriam+Libre'
license=('ofl')

_commit='b07806a6f57c74b57f744be755b87ea3b24fb93e'
_rawurl="https://cdn.rawgit.com/google/fonts/${_commit}/ofl/miriamlibre"

source=("${_rawurl}/MiriamLibre-Bold.ttf"
        "${_rawurl}/MiriamLibre-Regular.ttf")

sha256sums=('d88c315eb0b8c83f2db2929702b086063a7072448a5cccf78af47a9d2dd484f8'
            '277eaa259e6ef59252e0827fcf0738f23f46e5af289b243a187fa0f78ec7917f')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
