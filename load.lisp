(load "quicklisp.lisp")

(quicklisp-quickstart:install)

(pushnew
  (truename (make-pathname :directory '(:relative "ziz-git")))
  ql:*local-project-directories*)

(ql:register-local-projects)

(ql:quickload :ziz)

(ziz:with-distribution (dist :releases (list (truename (make-pathname :directory '(:relative "common-lisp-jupyter-git")))))
  (ql-dist:install-dist (ziz:distribution-info-url dist) :prompt nil)
  (ql:quickload :common-lisp-jupyter))
