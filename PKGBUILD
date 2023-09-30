# Maintainer: tacheometrist <tacheometrist@gmail.com>

pkgname=surrealist-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="Powerful graphical SurrealDB query playground and database explorer"
arch=("x86_64")
url="https://surrealist.starlane.studio"
license=("MIT")
groups=()
depends=("webkit2gtk" "gtk3")
provides=("surrealist")
conflicts=("surrealist")
source=("https://github.com/StarlaneStudios/Surrealist/releases/download/v${pkgver//_/-}/surrealist-v${pkgver//_/-}-linux.deb")
md5sums=("SKIP")

package() {
	bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
	echo "Comment=Powerful graphical SurrealDB query playground and database explorer" >> ${pkgdir}/usr/share/applications/surrealist.desktop
}
