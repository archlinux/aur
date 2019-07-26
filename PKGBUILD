# Maintainer: Versus Void <chaoskeeper somewhere at mail punctuation ru>
pkgname=reactotron
pkgver=2.16.0
pkgrel=1
pkgdesc="A desktop app for inspecting your React JS and React Native projects"
arch=('x86_64')
url="https://github.com/infinitered/reactotron"
license=('MIT')
source=("https://github.com/infinitered/reactotron/releases/download/v$pkgver/reactotron-app-$pkgver.x86_64.rpm")
sha256sums=('7659a9ee7927ffd02cb7b871c0f7d04482406f6b85b5eb2a3fc2d273932bc671')
noextract=("${source[0]##*/}")

package() {
	bsdtar -xf reactotron-app-$pkgver.x86_64.rpm -C "$pkgdir"
}
