# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=mpr-cli-bin
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="A CLI for the makedeb Package Repository"
arch=(x86_64 i686 aarch64)
url="https://github.com/jrop/mpr-cli"
license=('MIT')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(mpr)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://github.com/jrop/mpr-cli/releases/download/v$pkgver/mpr-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://github.com/jrop/mpr-cli/releases/download/v$pkgver/mpr-v$pkgver-linux-arm64.tar.gz")
source_i686=("https://github.com/jrop/mpr-cli/releases/download/v$pkgver/mpr-v$pkgver-linux-386.tar.gz")

noextract=()
sha256sums_x86_64=('a0a43971a1a681ffdfba98af52f9ab2f0e6ccf92e6ebbd089eee0f47bb92c24c')
sha256sums_i686=('1573248b367e58bdddf0663de80526fee387d4ba2e06a05b1a0589efd426156e')
sha256sums_aarch64=('5e0856e1666e413002deacb5300af0d541722f94b771f1b7306a0afec2a81053')
validpgpkeys=()

package() {
	install -Dm755 mpr* -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	install -Dm644 README* -t $pkgdir/usr/share/doc/$pkgname/
	printf "Please don't use this to install package\n"
}
