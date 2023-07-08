# tensorflow-amd-git
This repository is the PKGBUILD, patches, and test scripts for building the `tensorflow-amd-git` and `python-tensorflow-amd-git` packages on Arch Linux.
Unlike the `tensorflow-rocm` series of packages, which pull from the official tensorflow/tensorflow repo,
this package pulls directly from [AMD's upstream fork.](https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/)
Specifically, as of 2023-07-04 it draws on the "r2.12-rocm-enhanced" branch on the commit of [the last successful build.](http://ml-ci.amd.com:21096/job/tensorflow/job/release-rocmfork-r212-rocm-enhanced/job/release-build-whl/lastSuccessfulBuild/)
If that link is dead, you may be able to find an equivalent by following these breadcrumbs:
* [tensorflow/tensorflow](https://github.com/tensorflow/tensorflow/) ->
* [Community Supported TensorFlow Builds](https://github.com/tensorflow/build#community-supported-tensorflow-builds) ->
* [Linux AMD ROCm GPU Stable : TF 2.x 	Build Status 	Release 2.12](http://ml-ci.amd.com:21096/job/tensorflow/job/nightly-rocmfork-develop-upstream/job/nightly-build-whl/lastSuccessfulBuild/)

## Build instructions
```sh
sudo pacman -S base-devel
git clone https://aur.archlinux.org/packages/tensorflow-amd-git
cd tensorflow-amd-git
python update_last_successful.py # Optional, uses requests and bs4 libraries
makepkg
sudo pacman -U tensorflow*.zst python-tensorflow*.zst
```

## Tensorflow 2.14
You can build TensorFlow 2.14 from the unstable "develop-upstream" branch with two changes: update the "last good commit" hash, and change the branch of the git source link.
You can find a good commit hash from [AMD's Jenkins CI server.](http://ml-ci.amd.com:21096/job/tensorflow/job/nightly-rocmfork-develop-upstream/job/nightly-build-whl/lastSuccessfulBuild/)
Then update the PKBUILD like:
```sh
...
#_known_good_commit=de8086e14ae3152906e1137c212d2f7bb8ea463a
 _known_good_commit=1d35245a829159ef76b3a403d704a78dcd672bbf 
...
#source=('tensorflow-upstream-rocm::git+https://github.com/ROCmSoftwarePlatform/tensorflow-upstream#branch=r2.12-rocm-enhanced'
 source=('tensorflow-upstream-rocm::git+https://github.com/ROCmSoftwarePlatform/tensorflow-upstream#branch=develop-upstream'
...
```
I have not tested this.

## Building for other machines
This package uses `-march=native` to enable CPU specific optimizations. If you are building for other people to use do:
```sh
sed "s/-march=native/-march=x86_64/" -i PKGBUILD
```

## Building for other graphics cards
I have read that this repo needs no configuration to detect which supported cards are installed and build for them.
If you are building for a graphics card not installed on your machine, such as if you need to build for gfx1030 but you have a gfx1031 card installed,
you must create the file `/opt/rocm/bin/target.lst` and add each gfx architecture you want to build for.
Something like:
```sh
echo -e "gfx900\ngfx904\ngfx906\ngfx908\ngfx90a\ngfx1030" | sudo dd of=/opt/rocm/bin/target.lst
```
As of 2023-07-05, I have confirmed that RX 580 (gfx803) is NOT supported.
I have confirmed that you can use RX 6750 XT (gfx1031) by setting `target.lst` before building:
```sh
echo -e "gfx1030" | sudo dd of=/opt/rocm/bin/target.lst
```
and by setting this environment variable before running:
```sh
export HSA_OVERRIDE_GFX_VERSION=10.3.0
```
You can find your gfx by running `/opt/rocm/bin/rocminfo | grep gfx` after installing `rocminfo`.

## Fixing this PKGBUILD when it inevitably breaks
To learn what the build environment is supposed to look like, see the official Dockerfile for building tensorflow: [ROCmSoftwarePlatform/tensorflow-upstream in tensorflow/tools/ci_build/Dockerfile.rocm](https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/blob/develop-upstream/tensorflow/tools/ci_build/Dockerfile.rocm). That's where I found out about `target.lst` among other things; hopefully it helps.

If you are unable to build this, you may have luck with installing the python wheels. pip seems to think tensorflow-rocm is [only supported up to python 3.10](https://pypi.org/project/tensorflow-rocm/), so you will have to download the wheel [directly from AMD's website](http://ml-ci.amd.com:21096/job/tensorflow/job/release-rocmfork-r212-rocm-enhanced/job/release-build-whl/lastSuccessfulBuild/) and install it: `pip install tensorflow_rocm-2.12*cp311-cp311-manylinux2014_x86_64.whl`

Lastly, it appears the officially intended way to use TensorFlow on ROCm is by a docker image. It takes forever to download, so your system clock may desynchronize with the server, so you may get random permission errors while downloading. If you do, `sudo systemctl start systemd-timesyncd`. Otherwise, follow [the official instructions here](https://hub.docker.com/r/rocm/tensorflow) or [my longer tutorial here.](https://github.com/mpeschel10/test-tensorflow-rocm)

### Pull requests welcome.
