(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar a erva em si mesma antes."
      "Erva liberada para o paciente."))

(defun main ()
  (let* ((camomila (make-erva :nome "Camomila" :preco-por-grama 1.5 :toxicidade 1))
         (ginseng (make-erva :nome "Ginseng" :preco-por-grama 8.0 :toxicidade 5))
         (aconito (make-erva :nome "Aconito" :preco-por-grama 12.0 :toxicidade 9))
         (ervas (list camomila ginseng aconito)))
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%" (aviso e)))
    (format t "Dose de 10g de ginseng: R$~,2f~%"
            (preco-da-dose ginseng 10))))

(main)
