# Maintainer: egoroff <egoroff@gmail.com>
pkgname=dirstat-go-bin
pkgver=1.4.1
_app=dirstat
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Small tool that shows selected folder or drive usage statistic (binary release)"
url="https://github.com/aegoroff/dirstat"
license=('Apache')
source_x86_64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('854fd55c779fcec3f0afaf09e1538796d2e6b1de4d52795b22c4e4f496ab63ad')
sha256sums_armv7h=('29ddaae0d9245e85808ae0e5f6e00d9e7ed6fb6548b40418bb7207bb304fdb17')
sha256sums_aarch64=('b27f48176e2e816ca53f62c97ecd249794f99373661c413184fdeb650f3ba49f')

build() {
  return 0
}

package() {
  conflicts=("dirstat-bin" "dirstat-go")

  install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
  install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
  install -Dm0644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${_app}/CHANGELOG.md"
}
