(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "unit-test")

(uiop:quit (if (load "testing-tests.lisp") 0 1))
