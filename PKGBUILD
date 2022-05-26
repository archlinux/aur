# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=taywee-args
pkgver=6.4.1
pkgrel=1
pkgdesc="A simple, small, flexible, single-header C++11 argument parsing library"
arch=(any)
url="https://github.com/Taywee/args"
license=('MIT')
source=("https://github.com/Taywee/args/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a6491b2680979feb2f09e7ffb4f3c939b75057b6b4b90136b6cb72eaf5a462d3079dfb5836744e53bf4946bd575d4449f87129d6e50045732d7fba11c2be57dd')
b2sums=('4e82bef428fc3c671d72c6d7e60adf9f17bbe07ff05db04cf24a1547a8b8574f7e96ed17f5988ce379a94ed53267fe05e950521e4883cebb3b46a195e5b56209')

package() {
	cd "args-${pkgver}"
	install -vDm 644 args.hxx "${pkgdir}/usr/include/args.hxx"
    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
