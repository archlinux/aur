PKGBUILD for context-minimals
=============================

The ConTeXt Minimal <http://wiki.contextgarden.net/ConTeXt_Minimals> is
a complete, up-to-date ConTeXt distribution. It's main feature is that, unlike
Texlive, it provides an isolated installation of ConTeXt that is easy to update.
The Minimals target ConTeXt users and does not include LaTeX specific packages
and binaries.

This PKGBUILD provides an easy way to install the Minimals at

    /opt/context-minimals

To use the Minimals, initialize `$PATH` and some TeX related
variables by executing

    source /opt/context-minimals/setuptex

To run MkIV for the first time after installation or update, first source
`setuptex` and then run

    mtxrun --generate

as a normal user (**and not as root**). 

Report any bugs at the ConTeXt mailing list
<http://wiki.contextgarden.net/ConTeXt_Mailing_Lists>



