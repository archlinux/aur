# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=alire
pkgver=2.1.0
pkgrel=2
pkgdesc="A catalog of ready-to-use Ada libraries plus a command-line tool (alr) to obtain, build, and incorporate them into your own projects. It aims to fulfill a similar role to Rust's cargo or OCaml's opam."
arch=('i686' 'x86_64')
url="https://alire.ada.dev/"
license=(GPL3)
depends=(unzip)
makedepends=(git gprbuild)
checkdepends=(python-e3-testsuite python-pexpect python-toml)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alire-project/alire/archive/refs/tags/v$pkgver.tar.gz"
alire.patch
git+https://github.com/mosteo/aaa.git#commit=73d99ae1ff2f5210dc41c2ea7afebe600f9e9916
git+https://github.com/pmderodat/ada-toml.git#commit=f51ff9730aa916f33981db4589666577e9dd05c7
git+https://github.com/mosteo/ajunitgen.git#commit=e5d01db5e7834d15c4066f0a8e33d780deae3cc9
git+https://github.com/mosteo/ansi-ada#commit=0772e48d3e1f640829d142745a36b37edcd5470b
git+https://github.com/alire-project/clic#commit=56bbdc008e16996b6f76e443fd0165a240de1b13
git+https://github.com/mosteo/cstrings#commit=e4d58ad90bf32bc44304197e5906a519f5a9a7bf
git+https://github.com/mosteo/den#commit=377d1d906f83262b81b45c7989de8cd5b4aba67f
git+https://github.com/mosteo/dirty_booleans#commit=05c40d88ecfe109e575ec8b21dd6ffa2e61df1dc
git+https://github.com/mosteo/diskflags#commit=60729edf31816aca0036b13b2794c39a9bd0172e
git+https://github.com/alire-project/gnatcoll-core.git#commit=4e663b87a028252e7e074f054f8f453661397166
git+https://github.com/mosteo/lml_ada#commit=3d79edaff98bc4985014c641327ceb22d655df6b
git+https://github.com/mosteo/minirest#commit=9a9c660f9c6f27f5ef75417e7fac7061dff14d78
git+https://github.com/mosteo/optional#commit=7b8132a09a6c3c467409ab15d34fac605b1e5711
git+https://github.com/alire-project/semantic_versioning.git#commit=4861e32bd8a2f0df038d3ecc9a72b6381e7a34cc
git+https://github.com/mosteo/si_units#commit=9329d2591b82440ccc859a53f1380ac07ea4194d
git+https://github.com/alire-project/simple_logging.git#commit=3505dc645f3eef6799a486aae223d37e88cfc4d5
git+https://github.com/Fabien-Chouteau/spdx_ada#commit=2df9b1182544359c751544e52e14c94830d99fa6
git+https://github.com/mosteo/stopwatch#commit=f607a63b714f09bbf6126de9851cbc21cf8666c9
git+https://github.com/mosteo/toml_slicer#commit=3e5cbdb5673b85a1da6344a41764ef1cbafe3289
git+https://github.com/mosteo/umwi.git#commit=32496c15fe4fbb6cdab54ea11fbb0815549d2d48
git+https://github.com/mosteo/uri-ada.git#commit=02a0780d7757e9e79b3410c3a34960655cacea3d
git+https://github.com/alire-project/xmlezout.git#commit=1fcbd0b9303d044d8f09a8ef652afa8c0400ee8b
git+https://github.com/mosteo/yeison#commit=88b66242f8826fd4847e0ea06c7901b753e03c74
)
b2sums=('8e508ecf9d74fdda3ad38bedda5a1ff94df7acfcbc946d43af3585b41c1c768526884de6c03514d6e84f170c7b242de5c9aa84f51aabb9cacfb1fbef40585052'
        '5870866bb9addb3f0a917fbd545ace2bb11deba66bde4fc498c011b8a5cda7b0ef473b4b36d5642779149aff595996bd0f05e16ef87436eac7b3649d8594b71d'
        '7f17381597b9c81ea3bd1d95132868340352b9bd811ff0e02cf620d6c01274e815e9e03cad94fb88ec77047d77506cf96c7a324d3d8f74c81fb0e9213497f01c'
        '038a071df787c88c5905c8d1bc594eebda2f837ad45b53177a051e953f4374f4400063717ee78f7d6d733452610b8d6aac0fc4437181aeb20245c69a756f02ce'
        'c46d3b2dbfb4cf36fccca90f4c546a5121e4be34c5b8cda45e65d4e7296840789bb4c8979155861ca7e386ba318df84f81b9551653bbf1953b475b23a294597d'
        '31ef7b6d8c7419f71bbc99119865f92d7af460861523fc5cfd294f8143303e7f72503c13795250637eecadd94050fe59313f440c0f4a4396c967af79b25a41cc'
        '3786dcc29c882c72f6c80d177acd0ca7a1a4a1313ee51da708e8f1b01def8d524be885d91481c3f92d8b3adb5aa752a1fcc4a31b497e319984c3204e180467da'
        '035744149ec76b65c76ef2e08a47cdda8f30d5bf7f2dfb9708927c835219dbddf3b57aea983876d4cd5daebd3a91344bb30b41956206cb10cf90624acaa54a76'
        'afe01d3c6694c731215672338c8ba65c8e0a3ac86ec7c8da3e59946cbe200cc573ce737e0568dc236b075cbb444fc37ac3174e0857e8a7881a5366c05f221750'
        '123cb42b288de868bcd7e97057dfa851639e75976b4df0d6e668230ca89ae50afdf5f85cdb15c1fbfc2d921eef1a464d6ad106d97bc5deac0eca189d7ae65736'
        'ed3edbbcd9a8826428e77d4b3e23ebfd2f0dafefcfe129070725b0382a6d52349a31742c6beaa32c6d58caf117a36c6aa731e3930237909fb9cb5f2c8fbd1c4f'
        'ae22a179cafd88438d1b2f57be6f37515176bd00e3dbebdfdc587bcc81d5b7034b0090608f6a1e2786a4f2f1b35b9481c1f6a08e919d10cd951b9e482f2257f6'
        'f3a7368a0a6a05da7d9c848504385eb667fb85f358b4b495d6e1a658e1c637e3eb11340e3e939e4fa1dd0070caa3b55e3097a76245d74d7d259f98e9fc5eff85'
        'a43e64fef4481de0293f69fc194b600fc64f7e2d6d70f61f2c643e1717db9d6c50cfac2a292b25e8d8cb1707c10b7c4bfa4a406292aee8526ad47985b69a34c9'
        'd8a3e2eaeed5def7b69add5eb39f45a141ff586e9a796eff28ec65b3816a7765d99e65169976af938a01e26297ca679c921cb293e1739312a4ea95a38c6da135'
        '883cf4a0dadd1d67a12f79a1d7ee51911dab048e509c6d2dbd915701d28156c72de5ff745c37acb2865f67f8d573de0e0207b4f4b86bd085f9c33ee622769458'
        '5cff57253260d011f014d4d82363d1d9f9288ab5630f63ed0ac9314381784cfe4ff1f4f1763e6f943cfadc944b58248fd9a1d4260ab4974d27d0bc13f4354769'
        '2582f1809fffe20899c57c947aebf439a2e9a99c269168c10f11a876b82ebb11ed09c71308fae895134c6a3510b319d099b67e474cba36eaa5b24678379472c5'
        'f75890082fbe661fd0a2a18f9734b825e9519d9030611aa2e3b246f2f0a25721d45dc7c550296d81eadd8387d4baf926fbbb7a6cb77a2dc9c35835eb6c013fc4'
        '196eb6045eeb4d1a538d1058883e1620f104c655c6cccaaaf66eebedd3e62a5980b1ed40e2b942608c60f02a92899390750a10553ff8b57986c7255b92b1c390'
        '8cd2b0179993098a5fd29ceb67be01a8c21d504cae5173565c1048fb4cc6df0e2510e7fc46bfc1cac7a30b4dbce717085713de5df3e5a8f56ca70232383dc094'
        'feb53f76a7225faa99b50fcae8cf9eb78875ab7eb55e74a6d827aed987517396dac666e7ac77a65f5a2f0be2a2e2617757fb65570b57571dbeefcd91d730f651'
        '9b8068065ffd94f04b1d39145621469524ce681a786bf0c33f079d8570b81436f0e13100e34bf4d2ddab96cf94c85f548fafcb930ca9198cfe7e276713abecc1'
        '178b0f0bae8f22a8ed8abe6012b306d7be6cc57ad52710196497d313b182d5ad888821e2da8145ea3d49fd1867ced2c85f23d5d31d179440070362a4552caee4'
        '746d8e27e417aeea7ddc7b0139c753eee4ca1e5ba780e485a93b34575d9f9c67cd1bf7af66653113e4757d6416a8ff8f23336e883ef182095c146f2726c2524d')

prepare()
{
  # Get the submodules from the sources above
  patch --strip=1 < "$srcdir/alire.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gprbuild -j0 -P alr_env -XALIRE_OS=linux
}

check() {
  cd "$srcdir/$pkgname-$pkgver/testsuite"
  ./run.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  gprinstall -P alr_env -p --prefix="$pkgdir/usr" -XALIRE_OS=linux
  install -D scripts/alr-completion.bash "$pkgdir/usr/share/bash-completion/completions/alr"
}

# vim:set ts=2 sw=2 et:

