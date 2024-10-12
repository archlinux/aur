# Maintainer: SelfRef <arch@selfref.dev>

_basename=lilipod
pkgname=${_basename}-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Lilipod is a simple container manager, able to download, unpack and use OCI images from various container registries (binary version)"
arch=('x86_64')
url="https://github.com/89luca89/lilipod"
license=('GPL-3.0')
makedepends=('go')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::https://github.com/89luca89/lilipod/releases/download/v$pkgver/lilipod-linux-amd64")
sha256sums=('e781e67fd2eb42150f9bbcfd8338d9c248c27f061e720508ffc471731ae0001b')

package() {
	install -Dm755 lilipod "$pkgdir"/usr/bin/lilipod
}
