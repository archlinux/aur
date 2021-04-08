# Maintainer: coxackie
pkgname=code-icons
pkgver=1.55.1
pkgrel=1
pkgdesc='Change Code - OSS icons to VS Code ones'
arch=('any')
license=('unknown')
depends=('code')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'do.sh'
        'undo.sh'
        'com.visualstudio.code.svg'
        'letterpress.svg'
        'letterpress-dark.svg'
        'letterpress-hc.svg')
md5sums=('a19496680d3a6e94dcde01c7f6b443b1'
         '4fa33f870c615f86af8127165cbb36ed'
         '55e798d331600a8dc3ce282547d8284f'
         'bf0338d15dacc020bc65fbcf98b9001f'
         'fcae93243f3d0c408707711b833e408f'
         '0c284b5816605c2c3fb9d24b88b759b9'
         '0fb6c6b3251e012cee655ee300402029')


package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/do.sh" "${pkgdir}/usr/share/${pkgname}/do.sh"
  install -Dm 755 "${srcdir}/undo.sh" "${pkgdir}/usr/share/${pkgname}/undo.sh"
  install -Dm 644 "${srcdir}/com.visualstudio.code.svg" "${pkgdir}/usr/share/${pkgname}/vscode-icons/com.visualstudio.code.svg"
  install -Dm 644 "${srcdir}/letterpress.svg" "${pkgdir}/usr/share/${pkgname}/vscode-icons/letterpress.svg"
  install -Dm 644 "${srcdir}/letterpress-dark.svg" "${pkgdir}/usr/share/${pkgname}/vscode-icons/letterpress-dark.svg"
  install -Dm 644 "${srcdir}/letterpress-hc.svg" "${pkgdir}/usr/share/${pkgname}/vscode-icons/letterpress-hc.svg"
}
