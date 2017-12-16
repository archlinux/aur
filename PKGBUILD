# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: 0strodamus <0strodamus at cox dot net>
# Contributor: Rob McCathie <korrode AT gmail>
# Contributor: n00b <dannyurvt (at) gmail.com>
#
# Caja dependency is now optional for engrampa package.
# So we only include the .tap script.

pkgname=engrampa-thunar
epoch=1
pkgver=1.0
pkgrel=2
pkgdesc="Script to use engrampa with thunar-archive-plugin"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('thunar-archive-plugin<0.4.0' 'engrampa')
conflicts=("$pkgname<1:1.0" 'thunar-archive-plugin>=0.4.0')
source=('engrampa.tap')
sha256sums=('703eca26eb0da2229b5e5ee9445c30f5ad458bc1ba69fb23a426f971d4afce62')


package() {
    install -Dm755 "${srcdir}"/engrampa.tap "${pkgdir}"/usr/lib/xfce4/thunar-archive-plugin/engrampa.tap
}
