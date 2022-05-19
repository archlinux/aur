(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "fiveam")
(load "test.lisp")

(uiop:quit (if (fiveam:run! 'cl-utilities-tests::cl-utilities-suite) 0 1))
