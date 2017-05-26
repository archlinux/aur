;;; spacemacs-funcs --- Reusable functions from Spacemacs
;; Copyright (C) 2017  Alex Whitt

;; Author: Alex Whitt <alex.joseph.whitt@gmail.com
;; Version: 0.2

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Commentary:
;;
;; Loads the funcs.el files from Spacemacs in a somewhat customizable way.
;; Simply add the names of the Spacemacs layers you want to pull utility
;; functions from in spacemacs-funcs-enabled-layers.

;;; Code:
(mapc 'load (file-expand-wildcards "/usr/share/emacs/site-lisp/spacemacs-funcs/core*funcs.elc"))

(setq debug-on-error nil)

(defgroup spacemacs-funcs nil
  "Spacemacs utility functions"
  :group 'spacemacs-funcs
  :prefix "spacemacs-funcs-")

(defcustom spacemacs-funcs-enabled-layers nil
  "A list of Spacemacs layers from which to import utility functions."
  :type '(repeat string)
  :group 'spacemacs-funcs)

(defun spacemacs-funcs-load-layers ()
  "Load layers specified in spacemacs-funcs-enabled-layers."
  (dolist (file-string (file-expand-wildcards "/usr/share/emacs/site-lisp/spacemacs-funcs/layers*" t))
    (if (and (string-match "layers_.*_\\([[:alnum:]-]+\\)_funcs.elc" file-string)
	     (member (match-string 1 file-string) spacemacs-funcs-enabled-layers))
      (load file-string))))

(provide 'spacemacs-funcs)

;;; end
;;; spacemacs-funcs.el ends here
