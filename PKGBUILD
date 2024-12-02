# Maintainer: nizne <nizne@tutamail.com>
pkgname=pwdsafety-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Command line tool that checks how much a password is safe'
arch=('x86_64' 'aarch64' 'i686') # I'm not sure if the 'arm' in the repository refers to 'armv7h.'
url='https://github.com/edoardottt/pwdsafety'
license=('GPL-3.0-or-later')
provides=("pwdsafety=$pkgver")
conflicts=('pwdsafety-git')
source_x86_64=("pwdsafety_${pkgver}_linux_amd64.zip::https://github.com/edoardottt/pwdsafety/releases/download/v$pkgver/pwdsafety_${pkgver}_linux_amd64.zip")
source_i686=("pwdsafety_${pkgver}_linux_386.zip::https://github.com/edoardottt/pwdsafety/releases/download/v$pkgver/pwdsafety_${pkgver}_linux_386.zip")
source_aarch64=("pwdsafety_${pkgver}_linux_arm64.zip::https://github.com/edoardottt/pwdsafety/releases/download/v$pkgver/pwdsafety_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('a92da690952122d5b453fd87aaeffe9f9e82331f2c2a712b4a34c2976c37e336')
sha256sums_aarch64=('3358a0ceb7794baac6629042086897f839ebeca910b5642e7f28db077480bbb8')
sha256sums_i686=('c6a6b14ba33a87eeaccd7dcc914870225eddebe919400ec094bbbc7ff6785af7')

package() {
  install -Dm755 "${srcdir}/pwdsafety" "${pkgdir}/usr/bin/pwdsafety"
}
