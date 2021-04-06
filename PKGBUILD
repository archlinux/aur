# Maintainer: coxackie
pkgname=code-icons
pkgver=1.54.3
pkgrel=3
pkgdesc='Change Code - OSS icons to VS Code ones'
arch=('any')
license=('unknown')
depends=('code' 'patch')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh'
        'com.visualstudio.code.png'
        'letterpress.svg'
        'letterpress-dark.svg'
        'letterpress-hc.svg'
        'code-oss.desktop.diff'
        'code-oss-url-handler.desktop.diff')
md5sums=('db22ba0eaa2e6388054bde382ac8a392'
         '3801be89f56574475535d300e3744576'
         '04c4c453a76effa2d794fd6037fb1412'
         'fcae93243f3d0c408707711b833e408f'
         '0c284b5816605c2c3fb9d24b88b759b9'
         '0fb6c6b3251e012cee655ee300402029'
         'dc7dfd6638b1135d06b3cfbfcc8fc4b0'
         'd2e2ba227b8fede616452a43c7b60306')


package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
  install -Dm 644 "${srcdir}/com.visualstudio.code.png" "${pkgdir}/usr/share/${pkgname}/com.visualstudio.code.png"
  install -Dm 644 "${srcdir}/letterpress.svg" "${pkgdir}/usr/share/${pkgname}/letterpress.svg"
  install -Dm 644 "${srcdir}/letterpress-dark.svg" "${pkgdir}/usr/share/${pkgname}/letterpress-dark.svg"
  install -Dm 644 "${srcdir}/letterpress-hc.svg" "${pkgdir}/usr/share/${pkgname}/letterpress-hc.svg"
  install -Dm 644 "${srcdir}/code-oss.desktop.diff" "${pkgdir}/usr/share/${pkgname}/code-oss.desktop.diff"
  install -Dm 644 "${srcdir}/code-oss-url-handler.desktop.diff" "${pkgdir}/usr/share/${pkgname}/code-oss-url-handler.desktop.diff"
}
