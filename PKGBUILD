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
b2sums=('3f07c882f53df6241911d7a73a290a2276a006d5e191e1a92e3966d7ba647fb62f91876baf731d81608a1c03162787715c73210d45488659968c2144dd2fc169'
		'7ef531375ff8e8d1c690e17451970398e5771821732da718f642c1acc73e3e5071960b44b47537a94d09a367dd07b7215d9fba93f1b3eeb90c723674090bac76')

package() {
	install -Dm755 teamviewerd.run "$pkgdir"/etc/runit/sv/teamviewer/run
	install=teamviewerd.install
}
