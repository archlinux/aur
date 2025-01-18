# Maintainer: BartSte bartsteensma@outlook.com

    pkgname=fzf-help
    pkgver=2.3.2
    pkgrel=1
    pkgdesc="Use fzf to select command line options from --help"
    arch=('any')
    url="https://github.com/BartSte/fzf-help"
    license=('MIT')
    depends=('fzf' 'bat')
    source=("$pkgname::git+https://github.com/BartSte/fzf-help.git")
    md5sums=('SKIP')
    changelog="CHANGELOG.md"

    package() {
      cd "$srcdir/$pkgname"
      install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
      install -dm755 "${pkgdir}/usr/share/${pkgname}"
      cp -dr --no-preserve=ownership {src/*,uninstall} "${pkgdir}/usr/share/${pkgname}"
    }
