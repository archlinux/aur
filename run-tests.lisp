(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "alexandria/tests")

(unless (alexandria/tests::run-tests)
  (uiop:quit 1))

(quit)
