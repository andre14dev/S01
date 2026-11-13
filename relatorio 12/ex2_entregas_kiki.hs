pesoMaximo :: Double
pesoMaximo = 10.0

-- pesoMaximo = 20.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " kg - frete R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda "Padaria do Sr. Gustav" 4.5 12.0
        , Encomenda "Dona Osono" 15.0 30.0
        , Encomenda "Tombo" 8.0 20.0
        , Encomenda "Ursula" 25.0 50.0
        ]
  mapM_ putStrLn (map descrever encomendas)
  mapM_ putStrLn (map descrever (cabemNaVassoura encomendas))
  print (totalDeFretes (cabemNaVassoura encomendas))
