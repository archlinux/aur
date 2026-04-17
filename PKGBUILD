# Maintainer: Krzysztof Demir Kuzniak <krzysztofdemirkuzniak@gmail.com>
pkgname=flox-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="The Deterministic Foundation for your SDLC"
arch=('x86_64' 'aarch64')
url="http://flox.dev"
license=('custom:flox')
groups=('dev')
depends=('sudo')
provides=('nix')
backup=('etc/apt/sources.list.d/flox.list' 'etc/flox.toml' 'etc/flox-version' 'etc/init.d/nix-daemon' 'etc/nix/flox.conf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://flox.dev/downloads/debian-archive/flox.x86_64-linux.deb")
source_aarch64=("https://flox.dev/downloads/debian-archive/flox.aarch64-linux.deb")
sha512sums_x86_64=('27db524e0afaa6ecbec3cef5ed5c71d8eb21a395391758c66f8d999486419e02fcbff19e812b167629317f7edb8b5870f7b2f3fdfa5ed156c2377cc59e89a950')
sha512sums_aarch64=('SKIP')

package(){
	tar -xf data.tar.gz ${pkgdir}
}
