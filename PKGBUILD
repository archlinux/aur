# Maintainer: Jozef Riha <jose1711@gmail.com>

pkgname=nstress
pkgver=2014_10
pkgrel=1
pkgdesc="keep many parts of the computer busy including CPU, memory, file systems, IPC, disks"
url="https://www.ibm.com/support/pages/stress-test-your-aix-or-linux-server-nstress"
license=("unknown")
arch=('x86_64')
depends=('glibc')
source=(https://www.ibm.com/support/pages/system/files/inline-files/nstress_RHEL7_x86_64_Oct_2014.tar)
md5sums=('7d6355c39b8dd82641d06032dc46bc02')

package() {
  for i in ncpu ndisk64_75_linux nfile nlog nmem nmem64 nram
  do
    install -Dm755 "${i}" "${pkgdir}/usr/bin/${i}"
  done
}

