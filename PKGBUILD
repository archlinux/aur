# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=luffy-bin
_pkgname=luffy
pkgver=1.0.5
pkgrel=2
pkgdesc="Watch movies and series from your commandline"
arch=('x86_64')
url="https://github.com/DemonKingSwarn/luffy"
license=('GPL3')
depends=(mpv fzf yt-dlp chafa libsixel)
provides=(luffy)
conflicts=()
replaces=()
backup=()
options=()
source=("${url}/releases/download/v${pkgver}/${_pkgname}")
noextract=()
sha256sums=('SKIP')


package() {
	mkdir -p "$pkgdir"/usr/bin
  chmod +x "$_pkgname"
  cp -r "$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}
