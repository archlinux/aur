;                                                         -*-Scheme-*-
;;;
;;; Add component libraries for veroroute
;;;

(define geda-sym-path (build-path geda-data-path "sym"))

(for-each
 (lambda (dir)
   (if (list? dir)
       (component-library (build-path geda-sym-path (car dir)) (cadr dir))
       (component-library (build-path geda-sym-path dir)))
   )
 (reverse '(
  ; VeroRoute symbols
    ("veroroute_battery" "VeroRoute Battery") 
    ("veroroute_bbd" "VeroRoute BBD") 
    ("veroroute_connector" "VeroRoute Connector") 
    ("veroroute_diode" "VeroRoute Diode") 
    ("veroroute_electromechanical" "VeroRoute ElectroMechanical") 
    ("veroroute_linear" "VeroRoute Linear") 
    ("veroroute_logic" "VeroRoute Logic") 
    ("veroroute_passive" "VeroRoute Passive") 
    ("veroroute_regulator" "VeroRoute Regulator") 
    ("veroroute_spin" "VeroRoute Spin") 
    ("veroroute_transistor" "VeroRoute Transistor") 
    )))
