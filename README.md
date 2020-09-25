# MATLAB: Archlinux integration

This PKGBUILD creates an Arch Linux package for MATLAB
Additionally; it also builds python engine.

***WARNING***, this package NEEDS you to obtain the files; as the files are too large to host elsewhere.

## Tips

* You probably want to run this locally; since the package will be large.
If you are managing your own repos; depending on bandwidth and size constrants;
exclude this package from your workflow.
(Partial install is around 8 GB; and full install about 16 GB)
* Turn off compression if this package will only be installed on the build machine;
this cuts a fair amount of time from the build and compression is unneccessary on local machines.
* Set `MATLAB_INTEL_OVERRIDE='yes'` in your environment if hardware acceleration
does not work on your Intel GPU.

# Requirements

Besides the dependencies; the source files MUST be present at the directory.
The user MUST supply;

* **matlab.fik**: Plain text file installation key
* **matlab.lic**: License file
* **matlab.tar**: Software tarball

Then run `makepkg -s` from the PKGBUILD directory to build the package.

## File Installation Key & Licence File:

[Here is the current link to the instructions](https://www.mathworks.com/help/install/ug/install-using-a-file-installation-key.html)

File installation key identifies this specific installation of matlab.
The license file authorizes that this key can use the toolboxes.
Follow the steps;

* Go to [License center](https://www.mathworks.com/licensecenter) on mathworks
* On install and activate tab; select (or create) an appropriate license
* Navigate to download the license file and the file installation key
* Download the **license file** and put the file in the repository
* Copy and paste the **file installation key** in a plain text file

## Tarball

**To run the installer, libselinux is needed!**

* [Download the matlab installer](https://www.mathworks.com/downloads)
* Unpack and launch the installer
* After logging in and accepting license; select
`Advanced Options > I want to download without installing`
from the top dropdown menu.
* Set the download location to an empty directory called `matlab`
* Select the toolboxes you want in the `PKGBUILD`.
(Alternatively install them all)
* After downloading; from the parent directory; do
`tar --create --verbose --file matlab.tar matlab`
to create the tarball.

## Large files

To transport large files in fat32 media (most flash drives); use split and cat;
* **Split**: `split --bytes 3G --numeric-suffixes=0 matlab.tar.gz matlab.tar.gz.`
* **Concatenate**: `cat matlab.tar.gz.* > matlab.tar.gz`

## Modules

Matlab comes with a [lot of products](https://www.mathworks.com/products.html).
Most are not needed; check PKGBUILD to pick and choose appropriately.
