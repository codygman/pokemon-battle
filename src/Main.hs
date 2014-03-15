{-# LANGUAGE OverloadedStrings #-}
import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy as L
import Control.Monad.Random

data Ability = Ability 
    { 
      aName :: String
    , aUri :: String
    } deriving (Show)

data Move = Move 
    { learnType :: String
    , moveName :: String
    , moveUri :: String
    } deriving (Show)
      
data Pokemon = Pokemon { 
      abilities :: [Ability]
    , attack :: Int
    , catch_rate :: Int
    , created :: String
    , defense :: String
    , exp :: Int
    , hp :: Int
    , moves :: [Move]
    } deriving (Show)

-- generates one of the ORIGINAL AND ONLY 150 random pokemon 
randomPokemon :: IO Int
randomPokemon = getStdRandom (randomR (1,150))

-- make a json instance for pokemon and return that type!
getPokemon :: Int -> IO L.ByteString
getPokemon p = simpleHttp $ "http://pokeapi.co/api/v1/pokemon/" ++ show p ++ "/"

getMoves :: L.ByteString -> [Move]
getMoves p = undefined
 
main = putStrLn $ "You have " ++ show hp ++ " HP"
    where hp = 200
