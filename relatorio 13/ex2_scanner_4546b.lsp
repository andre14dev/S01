(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defparameter *catalogo*
  (list (make-criatura :nome "Peeper" :bioma "Safe Shallows"
                       :profundidade 10 :perigo :inofensiva)
        (make-criatura :nome "Bonefish" :bioma "Kelp Forest"
                       :profundidade 60 :perigo :agressiva)
        (make-criatura :nome "Stalker" :bioma "Kelp Forest"
                       :profundidade 120 :perigo :agressiva)
        (make-criatura :nome "Reaper Leviathan" :bioma "Dunes"
                       :profundidade 200 :perigo :leviata)))

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a - ~a - ~a m - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defun main ()
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))
  (format t "--- Abaixo de 100 m ---~%")
  (dolist (texto (mapcar #'descreve-criatura (abaixo-de 100 *catalogo*)))
    (format t "~a~%" texto))
  (format t "Total: ~a~%" (length (abaixo-de 100 *catalogo*))))

(main)
