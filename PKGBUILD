# Maintainer: coxackie
pkgname=code-icons
pkgver=1.54.3
pkgrel=2
pkgdesc='Change Code OSS icons to VSCode ones'
arch=('any')
license=('unknown')
depends=('code' 'patch')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh'
        'visual-studio-code.png'
        'letterpress.svg'
        'letterpress-dark.svg'
        'letterpress-hc.svg'
        'code-oss.desktop.diff'
        'code-oss-url-handler.desktop.diff')
md5sums=('db22ba0eaa2e6388054bde382ac8a392'
         'd5e4161d61932d262c6327e30bf77527'
         '04c4c453a76effa2d794fd6037fb1412'
         'fcae93243f3d0c408707711b833e408f'
         '0c284b5816605c2c3fb9d24b88b759b9'
         '0fb6c6b3251e012cee655ee300402029'
         '4bd7610b6fd58a9e2b7d557889d69c0d'
         'b03d8553fc370566e860c9bf98a80dd6')


package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
  install -Dm 644 "${srcdir}/visual-studio-code.png" "${pkgdir}/usr/share/${pkgname}/visual-studio-code.png"
  install -Dm 644 "${srcdir}/letterpress.svg" "${pkgdir}/usr/share/${pkgname}/letterpress.svg"
  install -Dm 644 "${srcdir}/letterpress-dark.svg" "${pkgdir}/usr/share/${pkgname}/letterpress-dark.svg"
  install -Dm 644 "${srcdir}/letterpress-hc.svg" "${pkgdir}/usr/share/${pkgname}/letterpress-hc.svg"
  install -Dm 644 "${srcdir}/code-oss.desktop.diff" "${pkgdir}/usr/share/${pkgname}/code-oss.desktop.diff"
  install -Dm 644 "${srcdir}/code-oss-url-handler.desktop.diff" "${pkgdir}/usr/share/${pkgname}/code-oss-url-handler.desktop.diff"
}
