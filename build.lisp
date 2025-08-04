(load "runtime/asdf.lisp")

(asdf:initialize-source-registry
 (list :source-registry
       :inherit-configuration (list :tree (uiop:getcwd))))

(asdf:load-system :ocicl)

(asdf:clear-source-registry)

(sb-ext:save-lisp-and-die "ocicl.core")
