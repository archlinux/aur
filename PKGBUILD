pkgname=difftance-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A diff tool to show edit distance"
arch=('x86_64')
url="https://github.com/fabon-f/difftance"
license=('MIT')
conflicts=('difftance-git')
source=("difftance::https://github.com/fabon-f/difftance/releases/download/v${pkgver}/difftance-linux-x86_64" "https://github.com/fabon-f/difftance/releases/download/v${pkgver}/LICENSE")
md5sums=('0bf69c8b47298802a6d3df7a4162c220' '334fc80d9b7396dc25a560729528c05c')

package() {
  chmod +x "${srcdir}/difftance"
  install -Dm755 "${srcdir}/difftance" "${pkgdir}/usr/bin/difftance"
  install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
