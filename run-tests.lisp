(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "fiasco")
(asdf:load-system "fiasco-self-tests")

(uiop:quit (if (fiasco:run-tests
                 (quote (:fiasco-basic-self-tests
                         :fiasco-intro-example
                         :fiasco-suite-tests))) 0 1))
