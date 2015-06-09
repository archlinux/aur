;;; whitespace-mode.el --- Major mode for editing Whitespace.
;; $Id: whitespace-mode.el,v 1.1 2003/04/26 16:56:54 lawrence Exp $

;; This file is NOT part of Emacs.

;; Copyright (C) 2003 lawrence mitchell <wence@gmx.li>
;; Filename: whitespace-mode.el
;; Version: $Revision: 1.1 $
;; Author: lawrence mitchell <wence@gmx.li>
;; Maintainer: lawrence mitchell <wence@gmx.li>
;; Created: 2003-04-26
;; Keywords: languages whitespace

;; COPYRIGHT NOTICE

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more
;; details. http://www.gnu.org/copyleft/gpl.html
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs. If you did not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave., Cambridge, MA 02139, USA.


;;; Commentary:
;; This is an Emacs major mode for the Whitespace programming
;; language: <URL: http://compsoc.dur.ac.uk/whitespace/>.  It
;; displays SPC as [SPC] and TAB as [TAB].

;;; Code:
(defconst whitespace-mode-version
  "$Id: whitespace-mode.el,v 1.1 2003/04/26 16:56:54 lawrence Exp $"
  "Version of Whitespace mode.")
(defvar whitespace-characters
  '((9 . "[TAB]")                       ; tab
    (32 . "[SPC]"))                     ; space
  "Alist of characters and mappings to the strings they should display as.")

(defvar whitespace-mode nil
  "Non-nil means that Whitespace mode is enabled.
In Whitespace mode, SPC and TAB self insert, and are displayed
according to their mapping sin `whitespace-characters'.

Setting this variable directly does not take effect;
use the function `whitespace-mode' instead.")
(make-variable-buffer-local 'whitespace-mode)

(defvar whitespace-mode-map
  (let ((map (make-keymap)))
    (define-key map (kbd "SPC") #'self-insert-command)
    (define-key map (kbd "TAB") #'self-insert-command)
    (define-key map (kbd "RET") #'newline)
    map)
  "Keymap for Whitespace mode.")

(defun whitespace-set-display ()
  "Set up the display of characters for Whitespace mode.

This walks across `whitespace-characters' and sets the
`buffer-display-table' accordingly."
  (let ((display-table (make-display-table)))
    (dolist (el whitespace-characters)
      (aset display-table (car el) (string-to-vector (cdr el))))
    (setq buffer-display-table display-table)))


(defun whitespace-mode (&optional arg)
  "Toggle Whitespace mode.

If called interactive with no prefix argument, toggle current
condition of Whitespace mode.
If ARG is positive, unconditionally enable Whitesapce mode, if arg is
negative, turn off Whitespace mode.

Uses the following keymap:
\\{whitespace-mode-map}

Entry to this mode calls the value of `whitespace-mode-hook'."
  (interactive "P")
  (let ((on-p whitespace-mode))
    (kill-all-local-variables)
    (setq whitespace-mode
          (if (null arg)
              (not on-p)
              (> (prefix-numeric-value arg) 0)))
    (when whitespace-mode
      (use-local-map whitespace-mode-map)
      (setq major-mode 'whitespace-mode)
      (setq mode-name "WS")
      (whitespace-set-display)
      (run-hooks 'whitespace-mode-hook))))

(defvar whitespace-mode-hook nil
  "*Hook run when entering Whitespace mode.")

(provide 'whitespace-mode)

;;; whitespace-mode.el ends here
