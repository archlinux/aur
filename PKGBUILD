# Maintainer: Nova Wittam <novawittam@gmail.com>
pkgname=nbtvol
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="A simple set of shell scripts and C programs to control bluetooth device volume through PulseAudio"
arch=("x86_64")
url="https://github.com/Not-Super-Nova/nbtvol"
license=('GPL3')
groups=()
depends=("systemd>=248.3-3" "dbus>=1.12.20-1" "sed>=4.8-1" "grep>=3.6-1" "coreutils>=8.32-1" "libpulse>=14.2-3" "bash>=5.1.008-3")
makedepends=("gcc>=11.1.0-1" "gcc-libs>=11.1.0-1")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
sha512sums=("cecf07dc75305745c350f6b18ab01f5e67c049ccfe58402cb3d66390ecb7fcb22d91475ac31e5029b12296f9496399fcb21a23607b223392ee46ea7941aaee2b")
validpgpkeys=()

build() {
	gcc main.c -o ./volwatcher
}

package() {
	mkdir -p ~/.local/bin
	cp ./volwatcher ./btVolume ./nbtvol ~/.local/bin/
}
