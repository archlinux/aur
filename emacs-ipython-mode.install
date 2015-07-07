#!/bin/bash

post_install() {

  echo ""
  echo "To enable auto-loading of ipython-mode, add these lines to your .emacs file:"
  echo ""
  echo "(autoload 'python-mode \"python-mode.el\" \"Python mode.\" t)"
  echo "(setq auto-mode-alist (append '((\"/*.\.py$\" . python-mode)) auto-mode-alist))"
  echo '(setq ipython-command "/usr/bin/ipython")'
  echo '(setq py-python-command "/usr/bin/ipython")'
  echo "(require 'ipython)"
  echo ""
}

post_upgrade() {

  post_install

}

