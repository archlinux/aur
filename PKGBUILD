# $Id$
# Maintainer: Malah <malah@neuf.fr>

pkgname=referenceassemblies-3.5-bin
pkgver=1.0
pkgrel=1
pkgdesc='Mono runtime - compiler compatibility for .NET 3.5'
arch=('any')
url='https://github.com/mono/reference-assemblies'
license=('MIT')
depends=('mono')
makedepends=('curl')
source=('https://github.com/mono/reference-assemblies/raw/master/v3.5/Microsoft.Build.Engine.dll'
        'https://github.com/mono/reference-assemblies/raw/master/v3.5/Microsoft.Build.Framework.dll'
        'https://github.com/mono/reference-assemblies/raw/master/v3.5/Microsoft.Build.Tasks.v3.5.dll'
        'https://github.com/mono/reference-assemblies/raw/master/v3.5/Microsoft.Build.Utilities.v3.5.dll'
        'https://github.com/mono/reference-assemblies/raw/master/v3.5/Mono.XBuild.Tasks.dll'
        'https://github.com/mono/reference-assemblies/raw/master/LICENSE')
sha256sums=('055a6d272ee4d34bb23adb275a650969bb2248eebcbbc174333ca245bf06299d' 
            '348b93dd8a8a2266d5b35215910b580852c8db7686b159a5f8a597fb7e92a01b' 
            '50fa2eda486c798b7c25b3ed8d29d2eb90cedf3cd1f1213558c8bfc3f2d2dcb8' 
            '2cbc92a4e64cb0e1ad68ab748ef6db03f3c065b1820fc651fa3501dbbb65685a'
            'a3865a32e67a2305263f62b3b7fab2a76d3cff064045a150fc96af3c9a3e4a7d'
            'cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310')

package() {
  install -Dm777 Microsoft.Build.Engine.dll -t "${pkgdir}"/usr/lib/mono/3.5/
  install -Dm777 Microsoft.Build.Framework.dll -t "${pkgdir}"/usr/lib/mono/3.5/
  install -Dm777 Microsoft.Build.Tasks.v3.5.dll -t "${pkgdir}"/usr/lib/mono/3.5/
  install -Dm777 Microsoft.Build.Utilities.v3.5.dll -t "${pkgdir}"/usr/lib/mono/3.5/
  install -Dm777 Mono.XBuild.Tasks.dll -t "${pkgdir}"/usr/lib/mono/3.5/
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/referenceassemblies-3.5-bin/
}