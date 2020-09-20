# Maintainer: Ramle <ramle@ramle.be>
_pkgname=passmenu-otp
pkgname=passmenu-otp-git
pkgver="1.o"
pkgrel=1
pkgdesc="A simple extension of passmenu friendly to one-time passwords (OTP), often used in two-factor authentication (2FA)."
arch=('any')
url="https://github.com/petrmanek/$_pkgname"
license=('MIT')
depends=(
         'git'
         'pass-otp'
         'bash'
         'dmenu'
	 'xdotool'
        )

source=("git+https://github.com/petrmanek/$_pkgname.git")
sha256sums=('SKIP')

package() {
	cd "$_pkgname"
	install -m 755 -D "$_pkgname" "$pkgdir/usr/bin/${_pkgname}"
}
