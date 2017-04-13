module Main where

import Lib
import Serializer.StringJsonSerializer
import Serializer.Json
import System.IO

main :: IO ()
main = do
        out <- openFile "output.json" WriteMode
        hPutStrLn out (serialize.(<@>).JObj $ [
                        ("Name", (<@>) "Sergey"),
                        ("Age", (<@>) (27::Int)),
                        ("Roles", (<@>).JArr $ [(<@>) "Developer", (<@>) "Team Lead"])])
        hClose out
        {-input <- openFile "output.json" ReadMode
        content <- hGetContent input
        let json = deserialize content-}


