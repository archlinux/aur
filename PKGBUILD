# Maintainer: egoroff <egoroff@gmail.com>
pkgname=dirstat-go-bin
pkgver=1.3.1
_app=dirstat
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Small tool that shows selected folder or drive usage statistic (binary release)"
url="https://github.com/aegoroff/dirstat"
license=('Apache')
source_x86_64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('285c094aaf4caf27f25ef8fed763448480d6d72fc4bfd07296ec87da7547c02c')
sha256sums_armv7h=('24ad6be14986395b9c6a9f5b44102c4977f4227914024c8ab3fc56cfe3562e74')
sha256sums_aarch64=('d89edf1ffa69024666dc802f90f6d54891c2f9fefe12bfbef6d4be636ec98ad9')

build() {
  return 0
}

package() {
  conflicts=("dirstat-bin" "dirstat-go")

  install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
  install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
