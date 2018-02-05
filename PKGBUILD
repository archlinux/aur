# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

_execname_=yn
pkgname=yn-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="an interactive y/n prompt"
arch=('x86_64')
url="https://github.com/JoshuaRLi/yn"
license=('MIT')
provides=('yn')
conflicts=('yn')

source_x86_64=("${url}/releases/download/${pkgver}/yn-${pkgver}-bin.tar.gz")
sha512sums_x86_64=('41129d259804d1b2df53f126b08589cecbe4d194679acdc3f49d5dd816ebb4671fdadc9a74b00390e20c7797e49d6069032cd454843b1683318bcdcf04a5aec3')

package () {
  cd "${srcdir}/yn-${pkgver}-bin"
  install -Dm 755 "${_execname_}" "${pkgdir}/usr/bin/${_execname_}"
  install -Dm 644 "${_execname_}.1.gz" "${pkgdir}/usr/share/man/man1/${_execname_}.1.gz"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
