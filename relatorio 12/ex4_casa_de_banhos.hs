data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a = cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let a1 = Atendimento "Sem-Rosto" "Banho de ervas" 100.0 NaFila
  let a2 = Atendimento "Deus do Rio" "Banho de lama" 300.0 NoBanho
  let a3 = Atendimento "Oshira-sama" "Banho de vapor" 150.0 NaFila
  let original = [a1, a2, a3]
  let atualizada = [concluir a1, a2, concluir a3]
  mapM_ putStrLn (map descrever original)
  print (arrecadado original)
  mapM_ putStrLn (map descrever atualizada)
  print (arrecadado atualizada)
