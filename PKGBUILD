pkgname="respect-my-internet-git"
pkgver="1.0"
pkgrel="1"
pkgdesc="most agressive privacy blocklist"
arch=("x86_64")
source=("respect-my-internet.sh")
sha256sums=("SKIP")
depends=('opensnitch-git' 'opensnitch-ebpf-module' 'git')
url="https://github.com/TheCyberArcher/Respect-My-Internet"

package() {

mkdir -p "${pkgdir}/usr/bin"
cp "${srcdir}/respect-my-internet.sh" "${pkgdir}/usr/bin/respect-my-internet"
chmod +x "${pkgdir}/usr/bin/respect-my-internet"

}