# Maintainer: egoroff <egoroff@gmail.com>
pkgname=dirstat-go-bin
pkgver=1.4.0
_app=dirstat
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Small tool that shows selected folder or drive usage statistic (binary release)"
url="https://github.com/aegoroff/dirstat"
license=('Apache')
source_x86_64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a9f9df8f722f543898134072bb410cbe031f6d9e3b4ff561c001a5bccc116c7d')
sha256sums_armv7h=('418fad687fd13173345c49309592c1e50a3282b34bdc1c16d5c909688965095f')
sha256sums_aarch64=('3629f19b1c3dbb08ad9da7a0cc9399cf293f722f5e8ffe4106e4fc107dc7234e')

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
