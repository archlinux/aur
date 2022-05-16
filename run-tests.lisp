(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "parenscript.tests")

(uiop:quit (if (fiveam:run 'parenscript.tests:parenscript-tests) 0 1))
;  "(setq *debugger-hook*
;         (lambda (condition x)
;           (declare (ignore x))
;           (let ((*standard-output* uiop:*stderr*))
;             (fresh-line)
;             (write-string \"Debugger entered with error \")
;             (princ (type-of condition))
;             (write-string \": \")
;             (princ condition)
;             (terpri)
;             (uiop:quit 1))))
;   (ql:quickload \"parenscript.tests\")
;   (let* ((fiveam:*print-names*               nil)
;          (fiveam:*test-dribble*              uiop:*stderr*)
;          (test-results (fiveam:run
;                          'parenscript.tests:parenscript-tests)))
;     (unless (fiveam:results-status test-results)
;       (fiveam:explain! test-results)
;       (uiop:quit 1)))")
