post_install() {
   echo
   echo "   Databases, docs, tests and examples are installed in /usr/share/phreeqc;"
   echo "   Do not forget to have a copy of the intended db in your working directory."
   echo "   Enjoy."
   echo
   echo "   For Emacs-users a phreeqc-mode is provided "
   echo "   Please put the lines"
   echo "   (setq load-path (cons \"/usr/share/emacs/site-lisp/phreeqc\" load-path))"
   echo "   (autoload 'phreeqc-mode "phreeqc" "PhreeqC editing mode" t)"
   echo "   (setq auto-mode-alist (append '(("\\.phrq$" . phreeqc-mode)) auto-mode-alist))"
   echo "   to your ~/.emacs"
   exit 0
}

pre_remove() {
   echo "   Please remove the lines containing"
   echo "   (setq load-path (cons \"/usr/share/emacs/site-lisp/phreeqc\" load-path))"
   echo "   (autoload 'phreeqc-mode "phreeqc" "PhreeqC editing mode" t)"
   echo "   (setq auto-mode-alist (append '(("\\.phrq$" . phreeqc-mode)) auto-mode-alist))"
   echo "   from your ~/.emacs"
}
# vim:set ts=2 sw=2 et:
