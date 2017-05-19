;;; spacemacs-funcs --- Reusable functions from Spacemacs
;;; Commentary:
;;
;; This file simply ncludes all *funcs.el files in the Spacemacs project.
;; This is a rough operation and makes little effort to sanitize what is imported.
;; That may happen someday but for now I just wanted to be able to grab
;; some of the utility functions that community has assembled.

;;; Code:
(mapc 'load (file-expand-wildcards "**/*funcs*.elc"))

(provide 'spacemacs-funcs)

;;; end
;;; spacemacs-funcs.el ends here
