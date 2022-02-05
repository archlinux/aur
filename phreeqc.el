;;; phreeqc.el --- Phreeqe code editing commands for Emacs

;; Copyright (C) 2000,2015,2021 dr. thomas baumann
;; Author: Dr. Thomas Baumann
;; Keywords: languages

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;;; Commentary:

;; Sets up a major-mode with support for the USGS geochemical
;; modeling program Phreeqc
;; Provides syntax highlighting and a template for common tasks
;;
;; Installation:
;; for automated loading add
;;
;; (autoload 'phreeqc-mode "phreeqc" "PhreeqC editing mode" t)
;; (setq auto-mode-alist (append '(("\\.\\(phrq\\|pqi\\)$" . phreeqc-mode)) auto-mode-alist))
;;
;; to your .emacs file

;;; History:
;; 

;;; Code:

(defgroup phreeqc nil
	"Major mode for editing Phreeqc input files in Emacs"
	:group 'languages)

(defcustom phreeqc-compile-command "/usr/bin/phreeqc"
	"Name and path to the phreeqc shell script (usually phreeqc.orig)."
	:type 'string
	:group 'phreeqc)

(defcustom phreeqc-database "/usr/share/phreeqc/database/phreeqc.dat"
	"Name and path of the default thermodynamic database."
	:type 'string
	:group 'phreeqc)

(defcustom phreeqc-manual-fn "/usr/share/doc/phreeqc/Phreeqc_3_2013_manual.pdf"
	"Name and path of the PhreeqC manual."
	:type 'string
	:group 'phreeqc)

(defcustom phreeqc-debug-buffer 0
	"Name of the debug buffer. If 0 then process runs asychronously" 
	:type 'string
	:group 'phreeqc)

(defcustom phreeqc-indent 4
  "*This variable gives the indentation in Phreeqc-Mode."
  :type 'integer
  :group 'phreeqc)

;; (defcustom phreeqc-output-folding nil
;;   "Visit phreeqc-output in folding-mode if non-nil."
;;   :type 'boolean
;;   :group 'phreeqc)

(defvar phreeqc-mode-abbrev-table nil
  "Abbrev table in use in Phreeqc-mode buffers.")
(define-abbrev-table 'phreeqc-mode-abbrev-table ())

(defvar phreeqc-mode-map nil
	"Keymap used in Phreeqc mode.")
(if phreeqc-mode-map
		nil
	(let ((map (make-sparse-keymap))
				(menu-map (make-sparse-keymap "Phreeqc")))
		;; (define-key map [C-tab] 'folding-shift-in)
		;; (define-key map [backtab] 'folding-shift-out)
		(define-key map "\C-c\C-c" 'phreeqc-compile)
		(define-key map "\C-c\C-v" 'phreeqc-visit-output)
		;; (define-key map "\M-j" 'electric-phreeqc-terminate-line)
		;; (define-key map "\r" 'phreeqc-electric-terminate-line)
		;; (define-key map [M-up] 'phreeqc-previous-fold)
		;; (define-key map [M-down] 'phreeqc-next-fold)
		(define-key map [menu-bar phreeqc] (cons "Phreeqc" menu-map))
		;; (define-key menu-map [folding-mode]
        ;;   '("Toggle folding" . folding-mode))
        (define-key menu-map [phreeqc-renumber-basic]
          '("Renumber basic statements" . phreeqc-renumber-basic))
		(define-key menu-map [phreeqc-visit-output]
          '("Visit Output" . phreeqc-visit-output))
		(define-key menu-map [phreeqc-compile]
          '("Run Phreeqc" . phreeqc-compile))
		(define-key menu-map [phreeqc-manual]
          '("Phreeqc manual" . phreeqc-visit-manual))
		(setq phreeqc-mode-map map)))

(defvar phreeqc-output-mode-map nil
	"Keymap used in Phreeqc-Output mode.")
(if phreeqc-output-mode-map
		nil
	(let ((map (make-sparse-keymap))
				(menu-map (make-sparse-keymap "Phreeqc-Output")))
		;; (define-key map [tab] 'folding-shift-in)
		;; (define-key map [C-tab] 'folding-shift-in)
		;; (define-key map [backtab] 'folding-shift-out)
		;; (define-key map [M-up] 'phreeqc-previous-fold)
		;; (define-key map [M-down] 'phreeqc-next-fold)
		(define-key map [menu-bar phreeqc] (cons "Phreeqc-Out" menu-map))
		;; (define-key menu-map [folding-mode]
        ;;   '("Toggle folding" . folding-mode))
		;; (define-key menu-map [phreeqc-previous-fold]
        ;;   '("Jump to previous simulation" . phreeqc-previous-fold))
		;; (define-key menu-map [phreeqc-next-fold]
        ;;   '("Jump to next simulation" . phreeqc-next-fold))
		;; (define-key menu-map [phreeqc-compile]
		;; 	'("Run Phreeqc" . phreeqc-compile))
		;; (define-key menu-map [phreeqc-visit-output]
		;; 	'("Visit Output" . phreeqc-visit-output))
		(setq phreeqc-output-mode-map map)))


(defvar phreeqc-mode-syntax-table nil
  "Syntax table in use in Phreeqc-mode buffers.")
(if phreeqc-mode-syntax-table
    nil
  (setq phreeqc-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\\ "\\" phreeqc-mode-syntax-table)
  (modify-syntax-entry ?\n ">   " phreeqc-mode-syntax-table)
  (modify-syntax-entry ?\f ">   " phreeqc-mode-syntax-table)
  (modify-syntax-entry ?\# "<   " phreeqc-mode-syntax-table)
  (modify-syntax-entry ?/ "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?* "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?+ "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?- "_" phreeqc-mode-syntax-table)
  (modify-syntax-entry ?= "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?% "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?< "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?> "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?& "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?| "." phreeqc-mode-syntax-table)
  (modify-syntax-entry ?_ "_" phreeqc-mode-syntax-table)
  (modify-syntax-entry ?\' "\"" phreeqc-mode-syntax-table))

(defconst phreeqc-block-re
  (regexp-opt '("ADVECTION" "CALCULATE_VALUES" "CALC_VALUE"
                "COPY" "DATABASE" "DELETE" "DUMP" "END"
                "EQUILIBRIUM_PHASES" "EQUILIBRIUM_PHASES_MODIFY" "EQUILIBRIUM_PHASES_RAW"
                "EXCHANGE" "EXCHANGE_MODIFY" "EXCHANGE_RAW" "EXCHANGE_MASTER_SPECIES"
                "EXCHANGE_SPECIES" "GAS_PHASE" "GAS_PHASE_MODIFY" "GAS_PHASE_RAW"
                "INCLUDE$" 
                "INCREMENTAL_REACTIONS" "INVERSE_MODELING" "ISOTOPES"
                "ISOTOPES_ALPHAS" "ISOTOPES_RATIOS"
                "KINETICS" "KINETICS_MODIFY" "KINETICS_RAW" "KNOBS"
                "LLNL_AQUEOUS_MODEL_PARAMETERS"
                "MIX" "NAMED_EXPRESSIONS" "PHASES" "PITZER" "PRINT"
                "RATES" "REACTION" "REACTION_MODIFY" "REACTION_RAW"
                "REACTION_PRESSURE" "REACTION_PRESSURE_RAW"
                "REACTION_TEMPERATURE" "REACTION_TEMPERATURE_RAW" "RUN_CELLS"
                "SAVE" "SELECTED_OUTPUT" "SIT" "SOLID_SOLUTIONS"
                "SOLID_SOLUTIONS_MODIFY" "SOLID_SOLUTIONS_RAW" 
                "SOLUTION" "SOLUTION_MODIFY" "SOLUTION_RAW"
                "SOLUTION_MASTER_SPECIES"
                "SOLUTION_SPECIES" "SOLUTION_SPREAD"
                "SURFACE" "SURFACE_MODIFY" "SURFACE_RAW"
                "SURFACE_MASTER_SPECIES"
                "SURFACE_SPECIES" "TITLE"
                "TRANSPORT" "USE" "USER_GRAPH" "USER_PRINT" 
                "USER_PUNCH" "Read input data for simulation")))

(defvar phreeqc-keyword-matcher
  (eval-when-compile
    (concat "^[ \t]*\\("
            phreeqc-block-re
            "\\)\\>"
            ;; The numbers
            "[ \t]*\\([0-9-]+\\)?"))
  "Phreeqc keywords.")

(defvar phreeqc-basic-keywords
  (regexp-opt '("ALK" "CELL_NO" "CHANGE_POR" "CHANGE_SURF" "CHARGE_BALANCE"
                "DESCRIPTION" "DH_A" "DH_Av" "DH_B" "DIST" "EOL$" "EPS_R" "GAS_P"
                "GAS_VM" "GRAPH_X" "GRAPH_Y" "KAPPA" "M" "M0" "MU" "OSMOTIC"
                "PERCENT_ERROR" "PLOT_XY" "PRINT" "PRESSURE" "PUNCH"
                "QBRN" "RHO" "RXN" "SAVE" "SC" "SIM_NO" "SIM_TIME" "SOLN_VOL"
                "STEP_NO" "TC" "TK" "TIME" "TOTAL_TIME" "VM"
                "AND" "OR" "XOR" "NOT" "DATA" "DIM" "END" "EOL$" "ERASE" "FOR" "TO" "STEP"
                "NEXT" "GOSUB" "GOTO" "IF" "THEN" "ELSE" "MOD" "ON" "READ" "REM"
                "RESTORE" "RETURN" "WEND")
                t)
  "Phreeqc BASIC keywords.")

(defvar phreeqc-basic-functions
  (regexp-opt '("ACT" "CALC_VALUE" "CHANGE_POR" "CHANGE_SURF"
                "EDL" "EQUI" "EQUI_DELTA"
                "EXISTS" "GAMMA" "GAS" "GET" "GET_POR"
                "GRAPH_X" "GRAPH_Y" "GFW"
                "ISO" "ISO_UNIT" "KIN" "KIN_DELTA" "LA" "LG"
                "LIST_S_S" "LK_NAMED" "LK_PHASE" "LK_SPECIES" "LM" "MISC1"
                "MISC2" "MOL" "PARM" "PHASE_FORMULA" "PLOT_XY" "PR_P" "PR_PHI" "PUT"
                "SI" "SR" "STR_E$" "STR_F$" "SUM_GAS" "SUM_SPECIES" "SUM_S_S" "SURF" "SYS"
                "S_S" "TOT" "TOTMOLE" "VM"
                "ABS" "ARCTAN" "ASC" "CHR$" "CEIL" "COS" "EXP" "FLOOR" "LOG" "LOG10" "LTRIM"
                "MID$" "PAD" "RTRIM" "SGN" "SIN" "SQR" "SQRT" "STR$" "TAN" "TRIM" "VAL"
                "WHILE")
              t)
  "Phreeqc BASIC functions.")

(defvar phreeqc-basic-keyword-matcher
  (eval-when-compile
    (concat "\\<\\("
            phreeqc-basic-keywords
            "\\)\\>"))
  "Matcher for Phreeqc BASIC keywords.")

(defvar phreeqc-basic-function-matcher
  (eval-when-compile
    (concat "\\<\\("
            phreeqc-basic-functions
            "\\)("))
  "Matcher for Phreeqc BASIC functions.")

(defvar phreeqc-builtin-matcher
  (eval-when-compile
    (concat "^[ \t]*[-]*"
            (regexp-opt '("Gugg_kj" "Gugg_nondim" "Margules" "Thompson"
                          "a_e" "activities" "activity_coefficients"
                          "alkalinity" "alyotropic_point" "analytical_expression"
                          "balances" "boundary_conditions" "cells" "charge_balance"
                          "comp" "comp1" "comp2" "convergence_tolerance"
                          "correct_disp" "critical_point" "davies"
                          "debug_diffuse_layer" "debug_inverse" "debug_model"
                          "debug_prep" "debug_set" "diagonal_scale" "diffuse_layer"
                          "diffusion_coefficient" "dispersivities" "distance"
                          "dump" "dump_frequency" "dump_restart" "eh" "end"
                          "equilibrate" "equilibrium" "equilibrium_phase"
                          "equilibrium_phases" "exchange" "file" "fixed_pressure"
                          "fixed_volume" "flow_direction" "force_solutions"
                          "formula" "gamma" "gas_phase" "gases" "headings"
                          "high_precision" "initial_time" "inverse"
                          "inverse_modeling" "ionic_strength" "isotope"
                          "isotope_uncertainty" "isotopes" "iterations"
                          "kinetic_reactants" "kinetics" "lengths"
                          "logfile" "m" "m0" "mineral_water" "minimal"
                          "miscibility_gap" "molalities" "mole_balance"
                          "no_check" "no_edl" "only_counter_ions" "other"
                          "parms" "pe" "pe_step_size" "percent_error" "pH"
                          "phases" "pressure" "print_cells" "print_frequency"
                          "punch" "punch_cells" "punch_frequency" "range"
                          "reaction" "reset" "runge_kutta" "saturation_indices"
                          "selected_out" "selected_output" "shifts" "shifts"
                          "simulation" "solid_solutions" "solution" "solutions"
                          "species" "stagnant" "start" "state" "status"
                          "step" "step_divide" "step_size" "steps" "surface"
                          "temperature" "temp" "tempk" "thermal_diffusion" "time"
                          "time_step" "tol" "tolerance" "totals" "uncertainty"
                          "uncertainty_water" "units" "user_print" "user_punch"
                          "volume" "warnings" "water" ) t)))
  "Phreeqc builtins.")

(defvar phreeqc-font-lock-keywords
  (list
   (list (concat ".*\\(SAVE\\)[ \t]*" 
                 (regexp-opt 
                  '("exchange" "equilibrium_phases" "gas_phase"
                    "solid_solution" "solution" "surface") t)
                 "[ \t]+\\([0-9-]+\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-function-name-face nil t)
         '(3 font-lock-type-face nil t))
   (list (concat ".*\\(USE\\)[ \t]*" 
                 (regexp-opt 
                  '("equilibrium_phases" "exchange" "gas_phase"
                    "kinetics" "mix" "reaction" "reaction_temperature"
                    "solid_solutions" "solution" "surface") t)
                 "[ \t]+\\([0-9-]+\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-function-name-face nil t)
         '(3 font-lock-type-face nil t))
   (list phreeqc-keyword-matcher
         '(1 font-lock-keyword-face)
         '(2 font-lock-type-face nil t))
   (list phreeqc-builtin-matcher
         '(1 font-lock-builtin-face))
   (list phreeqc-basic-keyword-matcher
         '(1 font-lock-keyword-face))
   ;;      '(2 font-lock-keyword-face nil t)
   (list phreeqc-basic-function-matcher
         '(1 font-lock-function-name-face))
   ;;       '(2 font-lock-constant-face nil t))
   )
  "Default expressions to highlight in PHREEQC mode.")


(defvar phreeqc-output-font-lock-keywords
  (list
   (list "\\(ERROR:\\)"
         '(1 font-lock-warning-face))
   )
   "Default expressions to highlight in PHREEQC output mode.")

;;;###autoload
(defun phreeqc-mode ()
  "Major mode for editing PHREEQC code.
This is much like C mode except for the syntax of comments.  It uses
the same keymap as C mode and has the same variables for customizing
indentation.  It has its own abbrev table and its own syntax table.

Turning on PHREEQC mode calls the value of the variable `phreeqc-mode-hook'
with no args, if that value is non-nil."
  (interactive)
  (require 'compile)
  (require 'autorevert)
  ;; (require 'folding)

  (kill-all-local-variables)
  (use-local-map phreeqc-mode-map)
  (make-local-variable 'comment-column)
  (make-local-variable 'comment-end)
  ;; (make-local-variable 'comment-indent-function)
  (make-local-variable 'comment-start)
  (make-local-variable 'comment-start-skip)
  (make-local-variable 'comment-line-function)
  (make-local-variable 'font-lock-keywords)
  (make-local-variable 'font-lock-defaults)
  (make-local-variable 'paragraph-ignore-fill-prefix)
  (make-local-variable 'paragraph-separate)
  (make-local-variable 'paragraph-start)
  (make-local-variable 'parse-sexp-ignore-comments)
  (make-local-variable 'phreeqc-compile-command)
  (make-local-variable 'phreeqc-database)
  (make-local-variable 'phreeqc-font-lock-keywords)
  (make-local-variable 'require-final-newline)
  (make-local-variable 'phreeqc-output-frame)
  
;  (make-local-variable 'tab-stop-list)

  (set-syntax-table phreeqc-mode-syntax-table)

  (setq comment-column 32)
  (setq comment-end "")
  ;; (setq comment-indent-function 'c-comment-indent)
  (setq comment-start "# ")
  (setq comment-start-skip "#+ *")
  (setq font-lock-defaults '(phreeqc-font-lock-keywords))
  (setq font-lock-keywords phreeqc-font-lock-keywords)
  ;; (setq indent-line-function 'tab-to-tab-stop)
  (setq local-abbrev-table phreeqc-mode-abbrev-table)
  (setq major-mode 'phreeqc-mode)
  (setq mode-name "Phreeqc")
  (setq paragraph-ignore-fill-prefix t)
  (setq paragraph-separate paragraph-start)
  (setq paragraph-start (concat "$\\|" page-delimiter))
  (setq parse-sexp-ignore-comments t)
  (setq require-final-newline t)
;  (setq tab-stop-list '(4 16 24 36))
  (toggle-truncate-lines t)
;  (setq font-lock-defaults '(phreeqc-font-lock-keywords))
;  (setq font-lock-keywords phreeqc-font-lock-keywords)
;  (folding-add-to-marks-list 'phreeqc-output-mode "Reading input"  "End of")
  ;; (folding-add-to-marks-list 'phreeqc-mode "TITLE" "END" nil t)
  (run-hooks 'phreeqc-mode-hook))

(defun phreeqc-output-mode ()
  "Major mode for visiting PHREEQC output files."
  (interactive)

  (use-local-map phreeqc-output-mode-map)
;  (setq font-lock-defaults '(phreeqc-font-lock-keywords))
;  (setq font-lock-keywords phreeqc-font-lock-keywords)
;  (folding-add-to-marks-list 'phreeqc-output-mode "Reading input"  "End of")
  ;; (folding-add-to-marks-list 'phreeqc-output-mode "Reading input data for simulation" "End of" nil t)

  (setq major-mode 'phreeqc-output-mode)
  (setq mode-name "Phreeqc-Output")
  (make-local-variable 'phreeqc-output-font-lock-keywords)
  (make-local-variable 'before-revert-hook)
  (make-local-variable 'after-revert-hook)
  (make-local-variable 'font-lock-keywords)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(phreeqc-output-font-lock-keywords))
  (setq font-lock-keywords phreeqc-output-font-lock-keywords)
  ;; (add-hook 'before-revert-hook (lambda nil
  ;;                                 (unless (phreeqc-run-fail-p)
  ;;                                   (folding-mode nil))) t)
  (add-hook 'after-revert-hook (lambda nil
                                 (if (phreeqc-run-fail-p)
                                     (phreeqc-goto-error)
                                   (font-lock-fontify-buffer)
;;                                   (folding-mode t)
;;                                   (folding-shift-in t)
                                   )
                                 (font-lock-fontify-buffer)) t)

  (read-only-mode t)
  (auto-revert-mode t)
  (if (phreeqc-run-fail-p)
      (phreeqc-goto-error)
    ;;    (folding-mode t)
    )
  (toggle-truncate-lines t)
  (font-lock-fontify-buffer))


;; Functions

(defun phreeqc-electric-terminate-line ()
  "Terminate line, unindent if looking at a keyword and indent next line."
  (interactive)
  ;; check if current line should be indented
  (if (not (eolp))
      (newline)
    (beginning-of-line)
    (skip-chars-forward " \t")
    (if (not (looking-at phreeqc-block-re))
        (phreeqc-newline t)
      (phreeqc-newline))))

(defun phreeqc-newline (&optional keep)
  "Insert a newline and indent following line like previous line."
  (interactive)
  (let ((hpos (current-indentation)))
    (or keep
        (beginning-of-line)
        (delete-horizontal-space))
    (end-of-line)
    (newline)
    (indent-to hpos)))

(defun phreeqc-tab ()
  "Indent to next tab stop."
  (interactive)
  (indent-to (* (1+ (/ (current-indentation) phreeqc-indent)) phreeqc-indent)))

;; (defun phreeqc-next-fold ()
;;   "Move to next simulation in folded output mode."
;;   (interactive)
;;   (if folding-stack
;;       (folding-shift-out))
;;   (next-line)
;;   (folding-next-visible-heading)
;;   (folding-shift-in))

;; (defun phreeqc-previous-fold ()
;;   "Move to previous simulation in folded output mode."
;;   (interactive)
;;   (if folding-stack
;;       (folding-shift-out))
;;   (folding-next-visible-heading 1)
;;   (folding-shift-in))
  

(defun phreeqc-compile ()
  "Compiles current file with Phreeqc."
  (interactive)
  (let* ((ctrlfile (make-temp-name
                    (expand-file-name "phreeqc" temporary-file-directory)))
         (infile (buffer-name))
         (outfile (concat (file-name-sans-extension infile) ".out"))
         (database phreeqc-database))
    
    ;; make sure that we start with a fresh output buffer to avoid problems
    ;; with huge output buffers slowing down emacs
    (if (buffer-live-p (get-buffer "*phreeqc*"))
        (kill-buffer "*phreeqc*"))
    
    (save-buffer)
    ;; check if a DATABASE keyword was given
    (save-excursion
      (goto-char 0)
      (if (re-search-forward "^DATABASE \\(.*.dat\\)" nil t)
          (setq database (match-string 1))))

    ;; make sure that the database file is readable
    (if (not (file-readable-p database))
        (progn (goto-char 0)
               (re-search-forward "^DATABASE \\(.*.dat\\)" nil t)
               (message "Database file \"%s\" not found, please check your input file."
                        database))
      (with-temp-file ctrlfile
        (insert infile "\n"
                outfile "\n"
                database "\n"))

      (call-process phreeqc-compile-command ctrlfile phreeqc-debug-buffer nil)
      (delete-file ctrlfile))))


(defun phreeqc-visit-output ()
  "Visit output from Phreeqc-Simulation."
  (interactive)
  (find-file-other-frame
   (concat (file-name-sans-extension buffer-file-name) ".out"))
  (phreeqc-output-mode))

(defun phreeqc-visit-manual ()
  "Visit PhreeqC v3 manual"
  (interactive)
  (find-file-other-frame phreeqc-manual-fn))


;; (defun phreeqc-next-output-fold ()
;;   "Visit output from Phreeqc-Simulation and move cursor to next fold."
;;   (interactive)
;;   (save-excursion
;;     (phreeqc-visit-output)
;;     (phreeqc-next-fold)))
    

(defun phreeqc-user-plot ()
  "Plot data with gnuplot according to specification in USER_GRAPH.
Keywords are compatible with Phreeqc for Windows

!!! WARNING: This part of phreeqc-mode is alpha !!!"
  (interactive)
  (save-excursion
    (goto-char 0)
    ))

(defun phreeqc-renumber-basic (&optional num)
      "Renumber the list items in the current -start .. -end
block. If the region is active use the START..END region. If
optional prefix arg NUM is given, start numbering from that
number instead of 10."
      (interactive "*P")
      (save-excursion
        (let (start end)
          (if (region-active-p)
              (progn
                (setq start (region-beginning))
                (setq end (region-end)))
            (setq start (re-search-backward  "^[ \t]*-start" nil t))
            (setq end (re-search-forward  "^[ \t]*-end" nil t)))
          (goto-char start)
          (setq num (or num 10))
          (save-match-data
            (while (re-search-forward "^[0-9]+[ ]*" end t)
              (replace-match (format "%-5d" num))
              (setq num (+ num 10)))))))

(defun phreeqc-run-fail-p ()
  "Scan the PhreeqC output buffer for ERROR messages.

Return non-nil if an error is found"
  (save-excursion
    (beginning-of-buffer)
    (search-forward "ERROR:" nil t)))

(defun phreeqc-goto-error ()
  "Jump to the location of an error in the Phreeqc source code."
    (beginning-of-buffer)
    (search-forward "ERROR:" nil t))
  

(provide 'phreeqc-mode)

;;; phreeqc.el ends here

