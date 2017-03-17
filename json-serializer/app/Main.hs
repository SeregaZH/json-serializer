module Main where

import Lib
import JsonSerializer

main :: IO ()
main = printJson (JObject [
                        ("Name", JString "Sergey"),
                        ("Age", JNumber 27),
                        ("Roles", JArray [JString "Developer", JString "Team Lead"])
                    ])


printJson :: JValue -> IO ()
printJson value = putStrLn (toString value)