# Maintainer: nizne <nizne@outlook.com>
pkgname=pwdsafety-bin
pkgver=0.4.2
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
sha256sums_x86_64=('a9e7b1fa9e3ca94af10418e935702732abcaf8be0b4fc29fda5566ea7d38fd86')
sha256sums_aarch64=('1f53dd4e2a5cab9af18432fc9d7de5d06fab2cae1bbaeb6a797df0e79ed4d025')
sha256sums_i686=('637482c7d540f938eb8021691ab0e1ffacf5d68fe481bdb32946e2a731f4651a')

package() {
  install -Dm755 "${srcdir}/pwdsafety" "${pkgdir}/usr/bin/pwdsafety"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
