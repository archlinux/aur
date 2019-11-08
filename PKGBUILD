# Maintainer: Versus Void <chaoskeeper somewhere at mail punctuation ru>
pkgname=reactotron
pkgver=2.17.1
pkgrel=1
pkgdesc="A desktop app for inspecting your React JS and React Native projects"
arch=('x86_64')
url="https://github.com/infinitered/reactotron"
license=('MIT')
source=("https://github.com/infinitered/reactotron/releases/download/v$pkgver/reactotron-app-$pkgver.x86_64.rpm")
sha256sums=('f2f341d28f9abfe1ab0c742a27e3dd124a603205bbd4eba3feee2531ef35a416')
noextract=("${source[0]##*/}")

package() {
	bsdtar -xf reactotron-app-$pkgver.x86_64.rpm -C "$pkgdir"
}
