# Maintainer: DuckSoft <realducksoft@gmail.com>
pkgname=dotnet-cli-telemetry-optout-git
pkgver=1
pkgrel=1
pkgdesc="systemd drop-in configuration to opt out .NET CLI telemetry"
arch=(any)
license=('GPL') 
source=(60-dotnet-cli-telemetry-optout.conf)
b2sums=('a5e38d3837d23af85d294b3ad37b0ec486f0fc7e25bb37df4abffafa810a7dfbd2cf8503241b82110b277d38887ff4256b638bee1632554305ecdf9e053de210')

package() {
    install -Dm644 60-dotnet-cli-telemetry-optout.conf -t $pkgdir/usr/lib/environment.d/
}
