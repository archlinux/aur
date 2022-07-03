I have enabled JIT compilation of all upstream-included elisp files. 
It means compilation will be painfully slow in older/slower CPUs, but 
runtime performance will be faster.

In order to compile all site-lisp on demand (repos/AUR packages, ELPA,
MELPA, whatever), add 

	(setq comp-deferred-compilation t)

to your .emacs file. All .eln files will go into $HOME/.emacs.d.

