# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=luffy-bin
_pkgname=luffy
pkgver=1.0.8
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('x86_64')
url="https://github.com/DemonKingSwarn/luffy"
license=('GPL3')
depends=(mpv fzf yt-dlp chafa libsixel)
optdepends=(kitty ghostty)
provides=(luffy)
conflicts=()
replaces=()
backup=()
options=()
source=("${url}/releases/download/v${pkgver}/${_pkgname}.amd64")
noextract=()
sha256sums=('64638c4a749773a6d51514b829170c96d65a63ce6904abb354cf15a612cb12ef')


package() {
	mkdir -p "$pkgdir"/usr/bin
  chmod +x "$_pkgname.amd64"
  cp -r "$_pkgname.amd64" "$pkgdir"/usr/bin/"$_pkgname"
}
