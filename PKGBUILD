# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=image-auditor-bin
_pkgname=image-auditor
pkgver=0.2.3
pkgrel=1
pkgdesc='TUI that finds & AI-fixes Lighthouse image issues (CLS, lazy loading, WebP, srcset) across your entire codebase in seconds.'
arch=('x86_64' 'aarch64')
url='https://github.com/0franco/image-auditor'
license=('MIT')
provides=('image-auditor')
conflicts=('image-auditor-git' 'image-auditor')
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('1a5b734d97a58f4787dada6c6f585336c6cd5aeec53da8f6bcae5870ff856b95')
sha256sums_aarch64=('b2365815d2a7320f40b58bff0a9a7f3621e9a1b8d9b0a715c12e1d8d8c766223')

package() {
    install -Dm0755 'image-auditor' "${pkgdir}"/usr/bin/image-auditor
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
