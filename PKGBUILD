# Maintainer: nizne <nizne@outlook.com>
pkgname=pwdsafety-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Command line tool that checks how much a password is safe'
arch=('x86_64' 'aarch64' 'i686') # I'm not sure if the 'arm' in the repository refers to 'armv7h.'
url='https://github.com/edoardottt/pwdsafety'
license=('GPL-3.0-or-later')
provides=("pwdsafety=$pkgver")
conflicts=('pwdsafety-git' 'pwdsafety')
source_x86_64=("pwdsafety_${pkgver}_linux_amd64.zip::https://github.com/edoardottt/pwdsafety/releases/download/v$pkgver/pwdsafety_${pkgver}_linux_amd64.zip")
source_i686=("pwdsafety_${pkgver}_linux_386.zip::https://github.com/edoardottt/pwdsafety/releases/download/v$pkgver/pwdsafety_${pkgver}_linux_386.zip")
source_aarch64=("pwdsafety_${pkgver}_linux_arm64.zip::https://github.com/edoardottt/pwdsafety/releases/download/v$pkgver/pwdsafety_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('b52e024a874688ff8c062bdc83c16cb00fafdb57b11b7064f2725b35d869932a')
sha256sums_aarch64=('ecfc5b2bb8eec6e193964cd01a2c6bb39e4c8cf9bbfce1c94a298cbf33458f4d')
sha256sums_i686=('3f4c6bf50d0cfb5105a2570909c4e02a7da64db32fe37d60b16f9d6e6b02be96')

package() {
  install -Dm755 "${srcdir}/pwdsafety" "${pkgdir}/usr/bin/pwdsafety"
}
