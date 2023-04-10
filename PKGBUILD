# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
_prgname=redumper
pkgname=redumper-bin
url="https://github.com/superg/redumper"
arch=('x86_64')
pkgdesc="Low level CD dumper utility"
provides=('redumper')
pkgver=build_118
pkgrel=1
_pkgfilename="redumper-2023.04.10_build118-Linux" # deviation from release tag, inclusion of date makes archive name nondeterministic :(
license=('GPL3')
source=('https://github.com/superg/redumper/releases/download/build_118/redumper-2023.04.10_build118-Linux.zip'
'https://raw.githubusercontent.com/superg/redumper/main/README.md'
'https://raw.githubusercontent.com/superg/redumper/main/LICENSE')
sha256sums=('855f14cdbe25926b56fc256ffab3b7250d86f62c8d431c85955d076041ea900e'
'f9c2f244b4630521f9252e8d2335d51e694359b2ecdf9771f3817afa0123e178'
'3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {

	# install binary
	install -Dm 755 ${srcdir}/${_pkgfilename}/bin/redumper ${pkgdir}/usr/bin/${_prgname}

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}
