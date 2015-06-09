;;; ats-mode.el --- Major mode to edit ATS source code

;; Copyright (C) 2007  Stefan Monnier
;; Author: Stefan Monnier <monnier@iro.umontreal.ca>
;; Keywords: ATS

;; updated and modified by Matthew Danish <mrd@debian.org> 2008

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; Todo:
;; - font-lock
;; - imenu
;; - outline
;; - indentation

;;; Code:

(require 'cl)
(require 'compile)

(when (not (boundp 'xemacsp))
  (setq xemacsp (boundp 'xemacs-logo)))

(defvar ats-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; (*..*) for nested comments.
    (modify-syntax-entry ?\( "() 1n" st)
    (modify-syntax-entry ?\) ")( 4n" st)
    (modify-syntax-entry ?*  ". 23n" st)
    ;; Not sure how to do // for single-line comments.
    ;; The current setting means that (/ and /* start a comment as well :-(
    (modify-syntax-entry ?/  ". 12b" st)
    (modify-syntax-entry ?\n ">  b" st)
    ;; Strings.
    (modify-syntax-entry ?\" "\"" st)
    ;; Same problem as in Ada: ' starts a char-literal but can appear within
    ;; an identifier.  So we can either default it to "string" syntax and
    ;; let font-lock-syntactic-keywords correct its uses in symbols, or
    ;; the reverse.  We chose the reverse, which fails more gracefully.
    ;; Oh, and ' is also overloaded for '( '{ and '[  :-(
    (modify-syntax-entry ?\' "_ p" st)
    ;;
    (modify-syntax-entry ?\{ "(}" st)
    (modify-syntax-entry ?\} "){" st)
    (modify-syntax-entry ?\[ "(]" st)
    (modify-syntax-entry ?\] ")[" st)
    ;; Skip over @/# when going backward-sexp over @[...], #[...],
    ;; #ident and $ident.
    (modify-syntax-entry ?\@ ". p" st)
    (modify-syntax-entry ?\# ". p" st)
    (modify-syntax-entry ?\$ ". p" st)
    ;; Same thing for macro&meta programming.
    (modify-syntax-entry ?\` ". p" st)
    (modify-syntax-entry ?\, ". p" st)
    ;; Just a guess for now.
    (modify-syntax-entry ?\\ "\\" st)
    ;; Handle trailing +/-/* in keywords.
    ;; (modify-syntax-entry ?+ "_" st)
    ;; (modify-syntax-entry ?- "_" st)
    ;; (modify-syntax-entry ?* "_" st)
    ;; Symbolic identifiers are kind of like in SML, which is poorly
    ;; supported by Emacs.  Worse: there are 2 kinds, one where "!$#?" are
    ;; allowed and one where "<>" are allowed instead.  Hongwei, what's that
    ;; all about?
    (modify-syntax-entry ?% "." st)
    (modify-syntax-entry ?& "." st)
    (modify-syntax-entry ?+ "." st)
    (modify-syntax-entry ?- "." st)
    (modify-syntax-entry ?. "." st)
    ;; (modify-syntax-entry ?/ "." st)  ; Already covered above for comments.
    (modify-syntax-entry ?: "." st)
    (modify-syntax-entry ?= "." st)
    ;; (modify-syntax-entry ?@ "." st)  ; Already defined above.
    (modify-syntax-entry ?~ "." st)
    ;; (modify-syntax-entry ?` "." st)  ; Already defined above.
    (modify-syntax-entry ?^ "." st)
    (modify-syntax-entry ?| "." st)
    ;; (modify-syntax-entry ?* "." st)  ; Already covered above for comments.
    (modify-syntax-entry ?< "." st)
    (modify-syntax-entry ?> "." st)
    (modify-syntax-entry ?! "." st)
    ;; (modify-syntax-entry ?$ "." st)  ; Already defined above.
    ;; (modify-syntax-entry ?# "." st)  ; Already defined above.
    (modify-syntax-entry ?? "." st)
    ;; Real punctuation?
    (modify-syntax-entry ?:  "." st)
    (modify-syntax-entry ?\; "." st)
    st))

(defvar ats-mode-font-lock-syntax-table
  (let ((st (copy-syntax-table ats-mode-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    st))

;; Font-lock.

(defface ats-font-lock-static-face
  '(;; (default :inherit font-lock-type-face)
    (t (:foreground "SkyBlue" :weight normal)))
  "Face used for static-related parts of code."
  :group 'ats-font-lock-faces)
(defvar ats-font-lock-static-face 'ats-font-lock-static-face)

(defface ats-font-lock-metric-face
  '(;; (default :inherit font-lock-type-face)
    (t (:foreground "Wheat" :weight bold)))
  "Face used for termination metrics."
  :group 'ats-font-lock-faces)
(defvar ats-font-lock-metric-face 'ats-font-lock-metric-face)

(defface ats-font-lock-keyword-face
  '(;; (default :inherit font-lock-keyword-face)
    (t (:foreground "Cyan" :weight normal)))
  "Face used for keywords."
  :group 'ats-font-lock-faces)
(defvar ats-font-lock-keyword-face 'ats-font-lock-keyword-face)

(defface ats-font-lock-c-face
  '(;; (default :inherit font-lock-comment-face)
    (t (:foreground "Pink" :weight normal)))
  "Face used for C code."
  :group 'ats-font-lock-faces)
(defvar ats-font-lock-c-face 'ats-font-lock-c-face)

(defun ats-context-free-search (regexp &optional limit)
  "Use inside a parenthesized expression to find a regexp at the same level."
  (let ((nest-lvl 0) foundp)
    (while (and (not (eobp))
		(or (null limit) (not (> (point) limit)))
		(not (minusp nest-lvl))
		(not (setq foundp
			   (and (zerop nest-lvl)
				(looking-at regexp)))))
      (cond ((looking-at "(\\|\\[\\|{")
	     (incf nest-lvl))
	    ((looking-at ")\\|\\]\\|}")
	     (decf nest-lvl)))
      (forward-char 1))
    foundp))

(defun ats-font-lock-mark-block ()
  (let ((lines 64))                     ; bit of a hack
    (set-mark (save-excursion (forward-line lines) (point)))
    (forward-line (- lines))))

(defun ats-font-lock-c-code-search (&optional limit)
  (interactive)
  ;; Font-lock mode works on regions that may not be large enough to
  ;; find both {% and %}.  Really, they should be treated like
  ;; comments and put into the syntax table.  Then the syntactic pass
  ;; would take care of C code.  However, there is only room for 2
  ;; kinds of comments in the table, and those are taken.  So the
  ;; keyword pass can try to get them.  But keyword pass doesn't
  ;; handle multiline keywords very well (because of region cutoff).
  ;; We can ignore the limit while searching, but coloration will not
  ;; happen outside the region anyway.  So it's going to be a little
  ;; screwy no matter what.  Not sure what to do about it.
  (setq limit nil)
  (let (begin end)
    (when (re-search-forward "%{[$#^]?" limit t)
      (setq begin (match-beginning 0))
      (when (re-search-forward "%}" limit t)
	(setq end (match-end 0))
	(when (and begin end)
	  (store-match-data (list begin end))
	  (point))))))

(defun ats-font-lock-static-search (&optional limit)
  (interactive)
  (when (null limit) (setq limit (point-max)))
  (let (foundp begin end (key-begin 0) (key-end 0) pt)
    (flet ((store ()
	     (store-match-data (list begin end key-begin key-end))))
      ;; attempt to find some statics to highlight and store the
      ;; points beginning and ending the region to highlight.  needs
      ;; to be a loop in order to handle cases like ( foo : type )
      ;; where initially it considers ( .. | .. ) but finds no '|'
      ;; char so it must then go inside and look for sub-regions like
      ;; ": type".
      ;;
      ;; Each branch of the cond must be sure to make progress, the
      ;; point must advance, or else infinite-loop bugs may arise.
      (while (and (not foundp) (< (point) limit))
	(setq key-begin 0 key-end 0)
	(cond
	 ((re-search-forward "(\\|:[^=]\\|{\\|[^[:space:].:-]<" limit t)
	  (setq pt (setq begin (match-beginning 0)))
	  (when pt (goto-char pt))
	  (cond
	   ;; handle { ... }
	   ((looking-at "{")
	    (forward-char 1)
	    (cond
	     ((save-excursion
		(forward-word -1)
		(looking-at "where"))
	      ;; except when preceeded by "where" keyword
	      (setq pt nil))
	     ((re-search-forward "}" limit t)
	      (setq end (match-end 0))
	      (store)
	      (setq pt end)
	      (setq foundp t))
	     (t
	      (setq pt nil))))
	   ;; handle ( ... | ... )
	   ((looking-at "(")
	    (forward-char 1)
	    (incf begin)
	    (cond
	     ((null (ats-context-free-search "|\\|)" limit))
	      (setq pt nil))
	     ((looking-at "|")
	      (setq end (match-end 0))
	      (store)
	      (setq foundp t))
	     ((looking-at ")")
	      (setq pt nil)
	      ;; no | found so scan for other things inside ( )
	      (goto-char (1+ begin)))))
	   ;; handle ... : ...
	   ((looking-at ":[^=]")
	    (forward-char 1)
	    (let ((nest-lvl 0) finishedp)
	      ;; emacs22 only:
	      ;;(ats-context-free-search ")\\|\\_<=\\_>\\|," limit)
	      (ats-context-free-search ")\\|[^=]=[^=]\\|,\\|\n\\|\\]" limit)
	      (setq begin (1+ begin)
		    end (point)
		    key-begin (1- begin)
		    key-end begin)
	      (store)
	      (setq foundp t)))
	   ((looking-at "[^[:space:].:-]<")
	    (forward-char 2)
	    (incf begin)
	    (cond
	     ((re-search-forward ">" limit t)
	      (setq end (match-end 0))
	      (store)
	      (setq pt end)
	      (setq foundp t))
	     (t
	      (setq pt nil))))
	   (t
	    (setq pt nil)
	    (forward-char 1)
	    (setq foundp t))))
	 (t
	  (setq foundp t)
	  (setq pt nil)))))
    pt))

(defvar ats-keywords
  '("\\<absprop\\>" "\\<abstype\\>" "\\<abst@ype\\>" "\\<absview\\>"
    "\\<absviewtype\\>" "\\<absviewt@ype\\>" "\\<and\\>" "\\<as\\>"
    "\\<assume\\>" "\\<begin\\>" "\\<break\\>" "\\<\\(s\\)?case\\(+\\|*\\)?\\>"
    "\\<class\\>" "\\<continue\\>" "\\<datasort\\>" "\\<dataprop\\>"
    "\\<datatype\\>" "\\<dataview\\>" "\\<dataviewtype\\>" "\\<dyn\\>"
    "\\<dynload\\>" "\\<else\\>" "\\<end\\>" "\\<exception\\>"
    "\\<extern\\>" "\\<fix\\>" "\\<fn\\>" "\\<for\\>" "\\<fun\\>"
    "\\<if\\>" "\\<implement\\>" "\\<in\\>" "\\<infix\\>" "\\<infixl\\>"
    "\\<infixr\\>" "\\<lam\\>" "\\<let\\>" "\\<llam\\>" "\\<local\\>"
    "\\<macdef\\>" "\\<macrodef\\>" "\\<method\\>" "\\<modprop\\>"
    "\\<modtype\\>" "\\<module\\>" "\\<nonfix\\>" "\\<overload\\>"
    "\\<par\\>" "\\<postfix\\>" "\\<praxi\\>" "\\<prefix\\>" "\\<prfn\\>"
    "\\<prfun\\>" "\\<prval\\>" "\\<object\\>" "\\<of\\>" "\\<op\\>"
    "\\<propdef\\>" "\\<rec\\>" "\\<sif\\>" "\\<sortdef\\>" "\\<sta\\>"
    "\\<stadef\\>" "\\<staif\\>" "\\<staload\\>" "\\<stavar\\>"
    "\\<struct\\>" "\\<symelim\\>" "\\<symintr\\>" "\\<then\\>"
    "\\<try\\>" "\\<typedef\\>" "\\<union\\>" "\\<val\\>" "\\<var\\>"
    "\\<viewdef\\>" "\\<viewtypedef\\>" "\\<when\\>" "\\<where\\>"
    "\\<while\\>" "\\<with\\>" "\\<withprop\\>" "\\<withtype\\>"
    "\\<withview\\>" "\\<withviewtype\\>" "\\$\\<extype\\>"))

(defvar ats-font-lock-keywords
  (append
   '((ats-font-lock-c-code-search (0 'ats-font-lock-c-face t))
     ;; ("%{[[:print:][:cntrl:]]*%}" (0 'ats-font-lock-c-face))

     ;;     ("[^%]\\({[^|}]*|?[^}]*}\\)" (1 'ats-font-lock-static-face))
     ;;     ("[^']\\(\\[[^]|]*|?[^]]*\\]\\)" (1 'ats-font-lock-static-face))
     ("\\.<[^>]*>\\." (0 'ats-font-lock-metric-face))
     (ats-font-lock-static-search (0 'ats-font-lock-static-face)
				  (1 'ats-font-lock-keyword-face)))

   (list (list (mapconcat 'identity ats-keywords "\\|")
	       '(0 'ats-font-lock-keyword-face)))))

(defvar ats-font-lock-syntactic-keywords
  '(("(\\(/\\)" (1 ". 1b"))             ; (/ does not start a comment.
    ("/\\(*\\)" (1 ". 3"))              ; /* does not start a comment.
    ("\\(/\\)///" (0 "< nb"))           ; Start a comment with no end.
    ;; Recognize char-literals.
    ("[^[:alnum:]]\\('\\)\\(?:[^\\]\\|\\\\.[[:xdigit:]]*\\)\\('\\)"
     (1 "\"'") (2 "\"'"))
    ))

(define-derived-mode c/ats-mode c-mode "C/ATS"
  "Major mode to edit C code embedded in ATS code."
  (unless (local-variable-p 'compile-command)
    (set (make-local-variable 'compile-command)
	 (let ((file buffer-file-name))
	   (format "atscc -tc %s" file)))
    (put 'compile-command 'permanent-local t))
  (setq indent-line-function 'c/ats-mode-indent-line))

(defun c/ats-mode-indent-line (&optional arg)
  (let (c-start c-end)
    (save-excursion
      (if (re-search-backward "%{[$#^]?" 0 t)
	  (setq c-start (match-end 0))
	(setq c-start 0)))
    (save-excursion
      (if (re-search-forward "%}" (point-max) t)
	  (setq c-end (match-beginning 0))
	(setq c-start (point-max))))
    (save-restriction
      ;; restrict view of file to only the C code for the benefit of
      ;; the cc-mode indentation engine.
      (narrow-to-region c-start c-end)
      (c-indent-line arg))))

;;;###autoload
(define-derived-mode ats-mode fundamental-mode "ATS"
  "Major mode to edit ATS source code."
  (set (make-local-variable 'font-lock-defaults)
       '(ats-font-lock-keywords nil nil ((?_ . "w") (?= . "_")) nil
	 (font-lock-syntactic-keywords . ats-font-lock-syntactic-keywords)
	 (font-lock-mark-block-function . ats-font-lock-mark-block)))
  (set (make-local-variable 'comment-start) "(*")
  (set (make-local-variable 'comment-continue)  " *")
  (set (make-local-variable 'comment-end) "*)")
  (setq indent-line-function 'tab-to-tab-stop)
  (setq tab-stop-list (loop for x from 2 upto 120 by 2 collect x))
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "RET") 'newline-and-indent-relative)
  (unless (local-variable-p 'compile-command)
    (set (make-local-variable 'compile-command)
	 (let ((file buffer-file-name))
	   (format "atscc -tc %s" file)))
    (put 'compile-command 'permanent-local t))
  (local-set-key (kbd "C-c C-c") 'compile)
  (cond
   ;; Emacs 21
   ((and (< emacs-major-version 22)
	 (not xemacsp))
    (pushnew '("\\(syntax error: \\)?\\([^\n:]*\\): \\[?[0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\]?" 2 3 4)
	     compilation-error-regexp-alist))
   ;; Emacs 22+ has an improved compilation mode
   ((and (>= emacs-major-version 22)
	 (not xemacsp))
    (pushnew '(ats "\\(syntax error: \\)?\\([^\n:]*\\): \\[?[0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\]?\\(?: -- [0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\)?" 2 (3 . 5) (4 . 6))
	     compilation-error-regexp-alist-alist)
    (pushnew 'ats compilation-error-regexp-alist))
   ;; XEmacs has something different, to be contrary
   (xemacsp
    (pushnew '(ats ("\\(syntax error: \\)?\\([^\n:]*\\): \\[?[0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\]?" 2 3 4))
	     compilation-error-regexp-alist-alist)
    (unless (eql 'all compilation-error-regexp-systems-list)
      (pushnew 'ats compilation-error-regexp-systems-list))
    (compilation-build-compilation-error-regexp-alist)
    (message "WARNING! XEMACS IS DEAD AND DEPRECATED."))))


(defun newline-and-indent-relative ()
  (interactive)
  (newline)
  (indent-to-column (save-excursion
		      (forward-line -1)
		      (back-to-indentation)
		      (current-column))))

;;; ATS Parser

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.yats\\'" . ats-parser-mode))

;;;###autoload
(define-derived-mode ats-parser-mode ats-mode "ATS-Parser"
  "Major mode to edit ATS Parser source code.")

;;; ATS Lexer

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.lats\\'" . ats-lexer-mode))

;;;###autoload
(define-derived-mode ats-lexer-mode ats-mode "ATS-Lexer"
  "Major mode to edit ATS Lexer source code.")



(provide 'ats-mode)
;;; ats-mode.el ends here


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; two-mode-mode.el -- switches between tcl and sgml(html) modes
;; $Id: two-mode-mode.el,v 1.4 2004/11/19 17:00:12 davidw Exp $

;; Copyright 1999-2004 The Apache Software Foundation

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at

;;	http://www.apache.org/licenses/LICENSE-2.0

;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;; These same concepts could be used to do a number of neat 2-mode
;; modes, for things like PHP, or anything else where you have a
;; couple of modes you'd like to use.

;; Use of 'psgml-mode' is highly recommended.  It is, of course, a
;; part of Debian GNU/Linux.

;; Author: David N. Welton <davidw@dedasys.com>

;; Modified by Marco Pantaleoni <panta@elasticworld.org>
;; to allow execution of an hook on mode switching.
;; Also added a standard mode hook and some documentation strings.

;; Janko Heilgeist <janko@heilgeist.com> and Stefan Schimanski
;; <1stein@gmx.de> submitted modifications that enable the use of
;; multiple modes, so I suppose that 'two-mode-mode' isn't strictly
;; accurate anymore.

;; Matthew Danish <mrd@debian.org> adapted this file to ATS mode.

(defvar ats-default-mode (list "ATS" 'ats-mode))
(defvar ats-second-modes (list
			   (list "C/ATS" "^%{[#^$]?" "%}" 'c/ats-mode)))

;; ----------------

(defvar ats-two-mode-update 0)
(defvar ats-two-mode-mode-idle-timer nil)
(defvar ats-two-mode-bool nil)
(defvar ats-two-mode-mode-delay (/ (float 1) (float 8)))

;; Mode switching hook
(defvar ats-two-mode-switch-hook nil
  "*Hook called upon mode switching.")
(setq ats-two-mode-switch-hook nil)

(defun ats-two-mode-mode-setup ()
  (add-hook 'post-command-hook 'ats-two-mode-mode-need-update nil t)
  (make-local-variable 'minor-mode-alist)
  (make-local-variable 'ats-two-mode-bool)
  (setq ats-two-mode-bool t)
  (when ats-two-mode-mode-idle-timer
    (cancel-timer ats-two-mode-mode-idle-timer))
  (setq ats-two-mode-mode-idle-timer
    (run-with-idle-timer ats-two-mode-mode-delay t
      'ats-two-mode-mode-update-mode))
  (or (assq 'ats-two-mode-bool minor-mode-alist)
    (setq minor-mode-alist
      (cons '(ats-two-mode-bool "/C") minor-mode-alist))))

(defun ats-two-mode-mode-need-update ()
  (setq ats-two-mode-update 1))

(defun ats-two-mode-change-mode (to-mode func)
  (if (string= to-mode mode-name)
    t
    (progn
      (funcall func)
      ;; After the mode was set, we reread the "Local Variables" section.
      ;; We do need this for example in SGML-mode if "sgml-parent-document"
      ;; was set, or otherwise it will be reset to nil when sgml-mode is left.
      (hack-local-variables)

      (ats-two-mode-mode-setup)
      (if ats-two-mode-switch-hook
	(run-hooks 'ats-two-mode-switch-hook))
      (if (eq font-lock-mode t)
	(font-lock-fontify-buffer))
      (turn-on-font-lock-if-enabled))))

(defun ats-two-mode-mode-update-mode ()
  (when (and ats-two-mode-bool ats-two-mode-update)
    (setq ats-two-mode-update 0)
    (let ((mode-list ats-second-modes)
	   (flag 0))
      (while mode-list
	(let ((mode (car mode-list))
	       (lm -1)
	       (rm -1))
	  (save-excursion
	    (if (re-search-backward (cadr mode) nil t)
	      (setq lm (point))
	      (setq lm -1)))
	  (save-excursion
	    (if (re-search-backward (car (cddr mode)) nil t)
	      (setq rm (point))
	      (setq rm -1)))
	  (if (and (not (and (= lm -1) (= rm -1))) (>= lm rm))
	    (progn
	      (setq flag 1)
	      (setq mode-list '())
	      (ats-two-mode-change-mode (car mode) (car (cdr (cddr mode)))))))
	(setq mode-list (cdr mode-list)))
      (if (= flag 0)
	(ats-two-mode-change-mode (car ats-default-mode) (cadr ats-default-mode))))))

;;;###autoload
(define-derived-mode ats-two-mode-mode ats-mode "ATS"
  "Turn on ats-two-mode-mode"
  (funcall (cadr ats-default-mode))
  (ats-two-mode-mode-setup))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.\\(d\\|s\\)ats\\'" . ats-two-mode-mode))

(provide 'ats-two-mode-mode)
