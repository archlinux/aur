(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "split-sequence/tests")
(asdf:load-system "fiveam")

(uiop:quit (if (fiveam:run! :split-sequence) 0 1))
