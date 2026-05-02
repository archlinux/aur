# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Paul Bredbury <brebs@sent.com>

# manual-hint: check the Arch forum thread for maintained script revisions
pkgname=findbrokenpkgs
pkgver=1.1
pkgrel=2
pkgdesc="Broken package identifier for Arch Linux, based on Gentoo's revdep-rebuild"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=13882"
license=('GPL-2.0-only')
depends=('binutils' 'pacman')
source=("${pkgname}-${pkgver}.sh")
sha256sums=('78c0d99689437d3b0832554724ea4dd80768d35c456c911d8bc662bbbcb4cc80')

package() {
  install -Dm755 "${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
