# Maintainer: Versus Void <chaoskeeper somewhere at mail punctuation ru>
pkgname=reactotron
pkgver=2.14.2
pkgrel=1
pkgdesc="A desktop app for inspecting your React JS and React Native projects"
arch=('x86_64')
url="https://github.com/infinitered/reactotron"
license=('MIT')
source=("https://github.com/infinitered/reactotron/releases/download/v$pkgver/reactotron-app-$pkgver.x86_64.rpm")
sha256sums=('59b2b3f69e8d429d4443e82406704ebcbbd858686f0cd64fc9b1e5a2ada50370')
noextract=("${source[0]##*/}")

package() {
	bsdtar -xf reactotron-app-$pkgver.x86_64.rpm -C "$pkgdir"
}
