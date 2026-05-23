# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=image-auditor-bin
_pkgname=image-auditor
pkgver=0.2.4
pkgrel=1
pkgdesc='TUI that finds & AI-fixes Lighthouse image issues (CLS, lazy loading, WebP, srcset) across your entire codebase in seconds.'
arch=('x86_64' 'aarch64')
url='https://github.com/0franco/image-auditor'
license=('MIT')
options=(!debug)
provides=('image-auditor')
conflicts=('image-auditor-git' 'image-auditor')
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('a4b1c5dbb7e7ae3191f8cf512e6fdd3301add0d1791f7fe0a5486ffa9d3ae87f')
sha256sums_aarch64=('2c36df84fe3c895396e2dd38b0ceedda0cd100eda2eb8249f86f9963bc816fb3')

package() {
    install -Dm0755 'image-auditor' "${pkgdir}"/usr/bin/image-auditor
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
