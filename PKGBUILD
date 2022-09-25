# Maintainer: Abhinav Gupta <mail@abhinavg.net>

pkgname='restack-bin'
pkgver=0.6.0
pkgrel=1
pkgdesc='Makes interactive Git rebase nicer.'
url='https://github.com/abhinav/restack'
arch=('aarch64' 'armv7h' 'x86_64')
license=('MIT')
provides=('restack')
conflicts=('restack')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/abhinav/restack/releases/download/v0.6.0/restack-linux-arm64.tar.gz")
sha256sums_aarch64=('77cdb5da042264e4393d9150c43ad3035a243dde665282043432b0ec57d7fa3f')

source_armv7h=("${pkgname}_${pkgver}_armv7h.tar.gz::https://github.com/abhinav/restack/releases/download/v0.6.0/restack-linux-armv7.tar.gz")
sha256sums_armv7h=('90b3e6e2aa106569c0ba93cf87f2d93eeb3e5b2056108f7c3931f7c073df6896')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/abhinav/restack/releases/download/v0.6.0/restack-linux-amd64.tar.gz")
sha256sums_x86_64=('953baadaa008293257627ce0fa541671105f13584826c7c291765654896fabe5')

package() {
  install -Dm755 "./restack" "${pkgdir}/usr/bin/restack"
}
