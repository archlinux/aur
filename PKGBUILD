# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=image-auditor-bin
_pkgname=image-auditor
pkgver=0.2.5
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
sha256sums_x86_64=('d18e16b6c5871d5bfb187df1c799ff61b80d4eb6b96ff27b60c461ede2ac0351')
sha256sums_aarch64=('484f7c7e8fb359562a6fd3da175a97dc849376b48d2d6287f06e9cea2009f79c')

package() {
    install -Dm0755 'image-auditor' "${pkgdir}"/usr/bin/image-auditor
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
