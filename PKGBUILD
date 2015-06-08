# Maintainer: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Alessio Bianchi <venator85 at gmail dot com>

pkgname=eclipse-fullscreen
pkgver=1.0.8
pkgrel=2
pkgdesc="Customizable plugin to make Eclipse go fullscreen and save space"
arch=('any')
url="https://github.com/ugosan/Eclipse-Fullscreen"
depends=('eclipse')
license="EPL/1.0"
source=("https://github.com/ugosan/Eclipse-Fullscreen/raw/master/build/plugins/org.ugosan.eclipse.fullscreen_${pkgver}.jar")
md5sums=('a5db3d5a6aa2f2b0e02b742335e0254b')

package() {
    install -D -m 644 ${srcdir}/org.ugosan.eclipse.fullscreen_${pkgver}.jar\
        ${pkgdir}/usr/share/eclipse/plugins/org.ugosan.eclipse.fullscreen_${pkgver}.jar
}
