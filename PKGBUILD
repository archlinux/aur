# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1656.7df5bc00
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible. Git version for x86_64"
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
license=('LGPL3' 'MIT')
depends=()
makedepends=('binutils' 'tar' 'ninja' 'git' 'cmake' 'libbsd')
provides=(c3c)
conflicts=(c3c)

_repository="https://apt.llvm.org/mantic/"
_llvmrep="17"
_llvmver="17"
_llvmpkgver="_17.0.3~++20231017063303+2e00f4ca4e91-1~exp1~20231017063319.18"
source=('git+https://github.com/c3lang/c3c.git'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/clang-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++abi1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++abi-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-common-'${_llvmver}'-dev'${_llvmpkgver}'_all.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-cpp'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-cpp'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-rt-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://launchpad.net/ubuntu/+archive/primary/+files/libedit2_3.1-20221030-2_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/liblld-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/liblld-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libllvm'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libllvm-'${_llvmver}'-ocaml-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libmlir-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libmlir-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libomp-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libomp5-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libpolly-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/lld-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-linker-tools'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-runtime'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-tools'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/mlir-'${_llvmver}'-tools'${_llvmpkgver}'_amd64.deb'
       )
md5sums=('SKIP'
	 '9210343ce6be97fcfc6cad9cc7143a40'
	 'ed43b23fb3a08ee27727d3568b4b1a83'
	 '5fea2e524b3d0a9f566f5a387f950c1f'
	 'fdc5f285d13bf98142d314425e33bc74'
	 '188478be98d1cb8478f503350ae6ab51'
	 'ac595ec80e8a76e30fe92f9725aebf8e'
	 '07577d3f88308280395c7741bb7023e3'
	 '16375c64b520d8757ccbcef34cb77bdc'
	 '096c1df8d912933b8159f3edadbbb601'
	 '28dd589d6160144ce6932b4ce40b53ff'
	 '3a19f56b9bb790d41a0507d1cf4741b8'
	 'dc66a491cd5514c069d8151a37ae9e7e'
	 'b4943af0fe5cca0064a4faefa341bcf1'
	 '12f025d10b78e0da8cfc1643b168d6bf'
	 '7faf5b034bbaa92a6369a489df330914'
	 '88c0cf0aabcb917bc0a7247dfa8558ae'
	 'b2087a71c5c5c850140c63e5dd55243a'
	 'cd90f98971d7c8672048b3e94ee0cb9a'
	 'f9c33b3cb11ce79dccdd54361de6ae63'
	 '2d699698a719b2e8116149b8bfe8feae'
	 '116531a7a298674291a203d68c2008e2'
	 '77fa2fde26cfc3a0026ef40f4f2d6467'
	 '6081f73731583d60ad57434405906b89'
	 'b66afad89a47cb4a306356d1bc4c45bc'
	 '42fccdf8b49b6fe405bd190378ede452'
	 'f41116fc36eee0bfc5171595eb2c06b9'
	 '3e79f711ff9670bde3cf1a155f56c472'
	 '07acde9dc842692637fbb329628a6308'
	)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/"
	for i in $(/bin/ls *.deb); do
	    ar p $i data.tar.zst | tar --use-compress-program=unzstd -x ;
	done
}

build() {
	cd "${srcdir}/${_pkgname}"
	export LD_LIBRARY_PATH=`readlink -e ${srcdir}/usr/lib/x86_64-linux-gnu`:${LD_LIBRARY_PATH}
	export PATH=`readlink -e ${srcdir}/usr/bin`:${PATH}
	cmake -B build \
              -G Ninja \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_C_COMPILER=clang-${_llvmver} \
              -DCMAKE_CXX_COMPILER=clang++-${_llvmver} \
              -DCMAKE_LINKER=lld-link-${_llvmver} \
              -DCMAKE_OBJCOPY=llvm-objcopy-${_llvmver} \
              -DCMAKE_STRIP=llvm-strip-${_llvmver} \
              -DCMAKE_DLLTOOL=llvm-dlltool-${_llvmver} \
              -DC3_LLVM_VERSION=${_llvmver}

	cmake --build build
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/${_pkgname}"

	cp "${srcdir}/${_pkgname}/build/c3c" "${pkgdir}/usr/lib/${_pkgname}/c3c"
	cp -r "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}/lib"
	ln -s "/usr/lib/${_pkgname}/c3c" "${pkgdir}/usr/bin/c3c"

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE_STDLIB" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_STDLIB"
}
