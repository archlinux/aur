pkgname=rwth-linux-kernel-programming
#use the year of the course as version
pkgver=2024
pkgrel=2
pkgdesc='Needed tools to for RWTH lecture "Linux Kernel Programming"'
url='https://teaching.os.rwth-aachen.de/LKP/'
arch=('any')
license=('GPL')
options=('!debug')
depends=(
	base-devel
	bc                 # kernel build dep
	cpio               # lab dependency
	git
	perl               # check patch/commits scripts/checkpatch.pl
	perl-authen-sasl   # git send-email
	perl-io-socket-ssl # git send-email
	perl-mime-tools    # git send-email
	qemu-desktop       # run the provided vm
)
optdepends=(
	'clang: clang language server'
	'python: needed to run scripts/clang-tools/gen_compile_commands.py to generate clang symbols (clang will find linux kernel symbols now)'
	'virtme-ng: easily and quickly recompile and test Kernel (alternative to provided vm at later labs)'
)
