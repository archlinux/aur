# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=germanium-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Generate image from source code"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/matsuyoshi30/germanium'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('08c9fd242960997b82a3d5d13685e4794aed4cf723216f3e31296e0cc1fc43c7')
sha256sums_i686=('a2bdb2041cb81c0db21754f4098549fac147b664911ceab3a85d10ad22859736')
sha256sums_aarch64=('98f86954539239283392ca64417156b5c753507d69161a6452f8a3e8f0cbeee1')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 CREDITS -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
