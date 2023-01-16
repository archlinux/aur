# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.2.2
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://roldanjr.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/roldanjr/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux.deb")
sha512sums=('0884ae28feb9aecb73cbb28e462489d9f237e528a9f483d49169a8809d3bc68b0ffdcd4661c9b7e361a05d92c44837de332136d65f80b8c3448732531a2e91d9')

package() {
	cd "${pkgdir}"
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
