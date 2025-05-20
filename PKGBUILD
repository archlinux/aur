pkgver=36
pkgrel=1
pkgbase=nodejs-electron-meta
pkgname=(nodejs-electron{34,35,36})
_desc='nodejs correpsponding with electron'
pkgdesc="${_desc} for makedepends"
arch=(any)
url='https://nodejs.org/'
license=(MIT)

package_nodejs-electron() {
	depends=(nodejs-electron36)
}
package_nodejs-electron36() {
	pkgdesc=${_desc}36
	depends=(nodejs-lts-jod)
}
package_nodejs-electron35() {
	pkgdesc=${_desc}35
	depends=(nodejs-lts-jod)
}
package_nodejs-electron34() {
	pkgdesc=${_desc}34
	depends=(nodejs-lts-iron)
}
