# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.1.0
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://roldanjr.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/roldanjr/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux.deb")
sha512sums=('85dfcc952a061c2143ef550692513e3a45be82d09982d9bd0fdc7cccc4868343a3be2b93ed1fade9f121d68a14176493c50ab7d77ed8fb0607ce8c45e26b4e52')

package() {
	cd "${pkgdir}"
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
