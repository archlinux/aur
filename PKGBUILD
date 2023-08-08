# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1469.c44a0528
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible"
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
license=('LGPL3' 'MIT')
depends=()
makedepends=('binutils' 'tar' 'ninja' 'git' 'cmake' 'libbsd')
provides=(c3c)
conflicts=(c3c)

_llvmver="16"
_llvmpkgver="_16.0.6~++20230710042020+7cbf1a259152-1~exp1~20230710162037.55"
source=('git+https://github.com/c3lang/c3c.git'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/clang-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libc++1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libc++-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libc++abi1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libc++abi-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libclang1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libclang-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libclang-common-'${_llvmver}'-dev'${_llvmpkgver}'_all.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libclang-cpp'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libclang-cpp'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libclang-rt-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://launchpad.net/ubuntu/+archive/primary/+files/libedit2_3.1-20221030-2_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/liblld-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/liblld-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libllvm'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libllvm-'${_llvmver}'-ocaml-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libmlir-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libmlir-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libomp-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libomp5-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/libpolly-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/lld-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/llvm-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/llvm-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/llvm-'${_llvmver}'-linker-tools'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/llvm-'${_llvmver}'-runtime'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/llvm-'${_llvmver}'-tools'${_llvmpkgver}'_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-'${_llvmver}'/mlir-'${_llvmver}'-tools'${_llvmpkgver}'_amd64.deb'
       )
md5sums=('SKIP'
	 'e0f06e5f644b1863f6205ba58b49ff7f'
	 'f2e426094ac6b043be6515905c7c5ff1'
	 '14221b529ec7bacf090f2300e0ce3231'
	 '2f29f4c96c12bb8bd0f62964a5511477'
	 '5a71e83be525a1aea15386e41e568178'
	 'a1666da5908be3e5cdc8c4f20967456e'
	 '6bd204f55de4a190f7bd3ce6f2a80265'
	 'c5f455bb61bfb1f38aecd09d434241a4'
	 '8c873d4cb85eed6152ad49f2182187de'
	 'c7d0acdf571de280fda75a80ece33ab0'
	 '3ac66f8b6324fd8fcc24917efe93e06f'
	 'dc66a491cd5514c069d8151a37ae9e7e'
	 '6b03f6b882730b5aa99ac95495588010'
	 'c200f1fe6ba6d76c0370b8874dd60520'
	 'b139753a7a9a60e0854b9bc5b1e58602'
	 '3fa47481f8407c3ffe3f9c006e7523b2'
	 'fd280661c2673140dc52dcf2a0c63939'
	 '48a674b2a6f19429a5a0059b1542780d'
	 '328f546bc1625e2b71d82f0a9d4a73c4'
	 'ecc05f7f422b9987d0dab2af9a5627a8'
	 '86cb00b5f1e4b978b59b01c1728df0d0'
	 '6ceff0eac0bf35c87f9d0000eae2e3d4'
	 '3d73a95a85cfe30ceffe0ede00312ef5'
	 '797ea513a52d5909ccf576f034d56194'
	 'c52b2fecd6959d64056da51891d181b9'
	 '23832d2efe8152ef85a5b1cba8d31f3e'
	 '3bd9315469994df2aeef76d15f124abc'
	 'e485c86c90c594d242a4966ef79e1f0b'
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
              -DCMAKE_BUILD_TYPE=Debug \
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
