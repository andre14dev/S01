data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "Caderno vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco "Ruinas ao Anoitecer" "nanquim" 5
        , Esboco "Criatura da Floresta" "grafite" 8
        , Esboco "Paisagem Sombria" "carvao" 3
        ]
  putStrLn (esbocoMaisRecente caderno)
  print (contarEsbocos caderno)
  print (horasDesenhando caderno)
  putStrLn (esbocoMaisRecente [])

  let cadernoNovo = Esboco "Castelo na Nevoa" "nanquim" 6 : caderno
  putStrLn (esbocoMaisRecente caderno)
  print (contarEsbocos caderno)
  putStrLn (esbocoMaisRecente cadernoNovo)
  print (contarEsbocos cadernoNovo)

  -- putStrLn (titulo (head []))
