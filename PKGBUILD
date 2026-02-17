# Maintainer: Andy <andy@andydekoning.nl>
pkgname=keychain-arch-light-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimalist SSH-agent manager for Arch Linux and Hyprland"
arch=('any')
url="https://github.com/andy-de-koning/keychain-arch-light"
license=('MIT')
depends=('bash' 'openssh')
provides=('keychain')
conflicts=('keychain')
source=("git+https://github.com/andy-de-koning/keychain-arch-light.git")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname%-git}/keychain" "${pkgdir}/usr/bin/keychain"
}
