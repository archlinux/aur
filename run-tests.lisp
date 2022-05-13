(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "ironclad/tests")
(asdf:load-system "ironclad-text")

(unless (rtest:do-tests)
  (uiop:quit 1))

(quit)
