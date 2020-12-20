# Contributor: linuxer <linuxer@artixlinux.org>

pkgname=teamviewer-runit
pkgalias=teamviewerd
_realname=teamviewer-runit
pkgdesc="Teamviewer, runit init scripts"
pkgver=1.3
pkgrel=1
pkgbase=teamviewer-runit
replaces=('teamviewer-runit')
arch=('any')
url="https://aur.archlinux.org/packages/teamviewer-runit"
license=('Apache')
groups=()
depends=('runit' 'teamviewer')
source=('teamviewerd.run'
	    'teamviewerd.install')
b2sums=('2abe3983796feee584fa1f0ab5ebfda33c692b8ddb668bc98aaa8c5910fd7312b7191370d3cae6f990b666f854391cae23ece09bd51eca02238f112ac780c2c1'
		'7ef531375ff8e8d1c690e17451970398e5771821732da718f642c1acc73e3e5071960b44b47537a94d09a367dd07b7215d9fba93f1b3eeb90c723674090bac76')

package() {
	install -Dm755 teamviewerd.run "$pkgdir"/etc/runit/sv/teamviewer/run
	install=teamviewerd.install
}
