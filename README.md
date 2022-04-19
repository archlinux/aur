# MATLAB with Arch Build System

This PKGBUILD creates an Arch Linux package for MATLAB.

Additionally, it also builds the Python engine. They are stored in `matlab` and `python-matlabengine` packages separately.

**WARNING**: this package NEEDS you to obtain the original off-line installer, as unauthorized distributions are not permitted by the license agreement.

## Tips

* You probably want to run this locally, since the package will be large. Turn off compression if this package will only be installed on the build machine.
  This cuts a fair amount of time from the build and compression is unnecessary on local machines.
* You may also use `tar` instead of packing it into `zst` and modify the PKGBUILD when preparing the off-line installer.
* If you are managing your own repos, depending on bandwidth and size constants,
  exclude this package from your work-flow.
  (Partial install is over 8 GB, and full install is about 12 GB)
* Set `MATLAB_INTEL_OVERRIDE='yes'` in your environment if hardware acceleration
does not work on your Intel GPU.

## Requirements

To successfully launch the MATLAB installer, you need to install `freetype2` and `libxcrypt-compat` (see [here](https://bbs.archlinux.org/viewtopic.php?id=274160)).

Besides the PKGBUILD dependencies, by the end of this procedure these source files MUST be present in the PKGBUILD directory:

* `matlab.fik`: installation key in a plain-text file.
* `matlab.lic`: license file.
* `matlab.tar`: off-line installer.

Then run `makepkg -s` from the same directory to build the package. It will take a lot of time, so make sure to bring with you a cup of coffee.

### File installation key & license file

[Here](https://www.mathworks.com/help/install/ug/install-using-a-file-installation-key.html) are the instructions by MathWorks.

The file installation key identifies this specific installation of MATLAB.
The license file authorizes that this key can use the toolboxes.
Follow these steps:

* Head over to the [License center](https://www.mathworks.com/licensecenter) on MathWorks.
* On the `Install and activate` tab, select or create an appropriate license:
    * If no license is listed because you're using your organization's license and this is your first time installing MATLAB, click the link for manual activation. Insert the MAC address of a network card on your PC in the Host ID field, as for the username, it'll have to be the one of the account (on your Arch installation) that will be using MATLAB.
* Navigate to download the license file and the file installation key.
* Download the **license file** and put the file in the repository with the correct name.
* Copy and paste the **file installation key** in a plain text file.

If MATLAB is distributed through your organization’s network rather than your own use, the file installation key and license file would be invalid on other computers. When MATLAB recognizes an invalid license, it won't start at all.

It may help if you remove your license for building, i. e. uncomment the lines at the end of `build()` of the PKGBUILD. When you start MATLAB for the first time, the activation program will pop out, guiding you through the activation process.

It still can be activated by running `activate_matlab.sh` after the install, no matter the license has been removed or not. The script will activate it and put the correct license file under `.matlab/licenses` in your home folder.

### Off-line installer

From here on it will be assumed all the following operations are performed from the PKGBUILD directory, and that the PKGBUILD directory contains exactly one MATLAB on-line installer archive.

If your MATLAB installation follows the exact steps listed down here, you can run the `install.sh` script provided with the PKGBUILD and let it do everything, you will only have to interact with the MATLAB installer.

1. [Download](https://www.mathworks.com/downloads) the MATLAB on-line installer archive; it will be named something like `matlab_R{YEAR}{a,b}_glnxa64.zip`.

2. Unpack the archive with:
    ```sh
    unzip -X -K matlab_*_glnxa64.zip -d MATLABROOT
    ```
   (see [here](https://www.mathworks.com/matlabcentral/answers/513162-matlab-2020a-installation-problem-in-linux#answer_423072) for an explanation of the flags).

3. Make the installer use the FreeType system library instead of its own (see [here](https://www.reddit.com/r/archlinux/comments/tkas9q/matlab_stopped_working_after_system_update/i2h3r5t/) for an explanation):
    ```sh
    mv MATLABROOT/bin/glnxa64/libfreetype.so.6 \
       MATLABROOT/bin/glnxa64/libfreetype.so.6.MATLAB
    ```

4. Launch the installer with:
   ```sh
   ./MATLABROOT/install
   ```
5. After having logged in and accepted the license agreement, select
`Advanced Options` → `I want to download without installing`
from the top-right drop-down menu.
6. Set the download location to an empty directory called `matlab`, contained inside the PKGBUILD directory.
7. Select `Linux` as the target platform.
8. Select the toolboxes you want. If you are not going to install them all, on the PKGBUILD set the `partialinstall` variable to `true`, and update the `products` array to reflect your choices, using the names at the end of `MATLABROOT/installer_input.txt`.
9. Download the files and close the installer.
10. Move the files from the directory `matlab/YYYY_MM_DD` to `matlab`, then delete the `matlab/YYYY_MM_DD` directory.
11. Create the tarball with:
    ```sh
    tar -I zstd -cvf matlab.tar matlab
    ```

If you acquire the off-line installer by other means, make sure the files have the correct permissions, as unzipping the archive without the proper flags could drop them, otherwise the installer won't run correctly.

### Transmitting large files

To transmit large files in FAT32 media (most flash drives), first split the tarball:

```sh
split --bytes 3G --numeric-suffixes=0 matlab.tar matlab.tar
```

Then recreate it by concatenating the parts:

```sh
cat matlab.tar.* > matlab.tar
```
