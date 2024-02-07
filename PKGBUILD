# Hi-Tech-arch-animation PKGBUILD

pkgname=HiTech-arch-animation
pkgver=1.0.r5
pkgrel=1
pkgdesc="Hi-Tech Arch Linux Plymouth Theme"
arch=('any')
url="https://github.com/xDeFc0nx/HiTech-arch-animation"
license=('MIT')
depends=('plymouth')

source=("git+${url}.git#commit=HEAD")
pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s" "$pkgver" "$(git rev-list --count HEAD)"
}
package() {
	cd "$srcdir"
	sudo cp -r "$pkgname"* "/usr/share/plymouth/themes/$pkgname/"
}
