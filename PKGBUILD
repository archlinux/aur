# Maintainer: egoroff <egoroff@gmail.com>
pkgname=dirstat-go-bin
pkgver=1.3.4
_app=dirstat
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Small tool that shows selected folder or drive usage statistic (binary release)"
url="https://github.com/aegoroff/dirstat"
license=('Apache')
source_x86_64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('08bae14bd24764abf35ba7a45d7fba10740424b86d211dd410ed1cdb17ff9d9c')
sha256sums_armv7h=('b93d8ce95780902241f15226103681ecab9abf9827562626d56a5d837f8fadeb')
sha256sums_aarch64=('5fdb809c51bacda273a7412c2dbfd409a09dc28ce48ff58ed842be43a42e710e')

build() {
  return 0
}

package() {
  conflicts=("dirstat-bin" "dirstat-go")

  install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
  install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
