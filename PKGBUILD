# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname=please
pkgver=1.2.0
pkgrel=1
pkgdesc="A command line utility that makes it easy to integrate web services into your shell scripts"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/stilvoid/please"
license=('MIT')
sha256sums_x86_64=('23403e04093555d891e78a80e17c36f123e2e417367fb51b878ee1ee7e7cc6bd1')
sha256sums_aarch64=('8add6957b5f9cc750f60c9548362e39b9261253eee56f50fbb8a753da666f62e8')
sha256sums_i686=('d52a7b648959f5e66cbab13445a2bbb396b46e6b59b91f79feccc6536be80c56')
source_x86_64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.zip")
source_aarch64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.zip")
source_i686=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_i386.zip")

package() {
  install -Dm 755 "${srcdir}/please" "${pkgdir}/usr/bin/please"
}
