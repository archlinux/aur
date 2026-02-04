# Maintainer: egoroff <egoroff@gmail.com>
pkgname=dirstat-go-bin
pkgver=1.3.4
_app=dirstat
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Small tool that shows selected folder or drive usage statistic (binary release)"
url="https://github.com/aegoroff/dirstat"
license=('Apache')
source_x86_64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('18193b62244b979a2ef04949a4c9555e274299a4c966e4e1a06dfb3e116a2120')
sha256sums_armv7h=('9a782b45f063cf31d10a34858a75530581381404f032e8e40fab5769ee42f206')
sha256sums_aarch64=('826a9f196b47fea4f1966c5d63dc4bcae0a9d6066daf54d5fd5e35e1d6839143')

build() {
  return 0
}

package() {
  conflicts=("dirstat-bin" "dirstat-go")

  install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
  install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
