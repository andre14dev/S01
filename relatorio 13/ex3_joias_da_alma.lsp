(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((madoka (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 2))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 60 :bruxas 5))
         (homura (make-garota-magica :nome "Homura" :escuridao 35 :bruxas 12))
         (grupo (list madoka sayaka homura))
         (nova (make-garota-magica :nome "Mami" :escuridao 20 :bruxas 8))
         (grupo-novo (cons nova grupo))
         (purificada (purifica sayaka 25)))
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas: ~a~%" (total-de-bruxas grupo))
    (format t "Escuridao do grupo antigo: ~a~%" (escuridao-total grupo))
    (format t "Escuridao do grupo novo: ~a~%" (escuridao-total grupo-novo))
    (format t "Sayaka original: ~a~%" (garota-magica-escuridao sayaka))
    (format t "Sayaka purificada: ~a~%" (garota-magica-escuridao purificada))))

(main)
