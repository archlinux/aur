# Maintainer: A. Benz <hello@benz.dev>
pkgname=remindme-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='scheduled notifications'
url='https://github.com/abenz1267/remindme'
source_x86_64=("https://github.com/abenz1267/remindme/releases/download/v$pkgver/remindme_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/remindme/releases/download/v$pkgver/remindme_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('remindme')
provides=('remindme')
sha256sums_x86_64=('b531503b262f29708ad75b8c9c0a993c42265429b3d0f5d299ea4c95c0753986')
sha256sums_aarch64=('1dc7856d857176986cab66cd308ca090657b589eedcce1115a901dc0109c78f8')

package() {
  cd "$srcdir/"

  install -Dm755 remindme "${pkgdir}/usr/bin/remindme"
}
