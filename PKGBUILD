# Maintainer: czyt <czytcn@gmail.com>
pkgname=whatcable-cli-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A linux/KDE port of whatcable, a tool to tell you what each USB connected cable can do (CLI)"
arch=('x86_64')
url="https://github.com/Zetaphor/whatcable-linux"
license=('MIT')
depends=('qt6-base' 'systemd-libs')
provides=('whatcable-cli')
conflicts=('whatcable-cli')
source_x86_64=("https://github.com/Zetaphor/whatcable-linux/releases/download/v${pkgver}/whatcable-linux-cli-v${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('28fc097ff0201aa7f389c4ecb1a88dab851e9e5ded9fecfdaaf0566bc11feb70')

package() {
    install -Dm755 "${srcdir}/whatcable-linux" "${pkgdir}/usr/bin/whatcable"
}
