module Main where

import Lib
import Serializer.StringJsonSerializer
import Serializer.Json

main :: IO ()
main = putStrLn "some" {-printJson (JObject [
                        ("Name", JString "Sergey"),
                        ("Age", JNumber 27),
                        ("Roles", JArray [JString "Developer", JString "Team Lead"])
                    ])-}


{-printJson :: JValue -> IO ()
printJson value = putStrLn (serialize value)-}