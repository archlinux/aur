# Maintainer: Piotr Kubaty
pkgname=graph-editor-bin
pkgver=0.1
pkgrel=1
pkgdesc="apk of graph-editor-for-android application, built from https://github.com/Student-Team-Projects/Graph-Editor-Android, https://github.com/Student-Team-Projects/Graph-Editor-Core"
arch=(x86_64)
url="https://github.com/Student-Team-Projects/Graph-Editor-Android-bin"
license=('GPL')
makedepends=('git')
source=("https://github.com/Student-Team-Projects/Graph-Editor-Android-bin/releases/download/final/graph-editor-for-android.apk")
md5sums=('SKIP')

package() {
	mkdir -p "${pkgdir}/usr/opt"
	cp "${srcdir}/releases/download/final/graph-editor-for-android.apk" "${pkgdir}/usr/opt/graph-editor-for-android.apk"
}