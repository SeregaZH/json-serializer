module JsonSerializer (
    JValue(..),
    getString,
    getInt,
    getDouble,
    getObject,
    getArray,
    getBool,
    isNull,
    toString
) where

import Data.List (intercalate)

data JValue = JString String
                | JNumber Double
                | JBool Bool
                | JNull
                | JObject [(String, JValue)]
                | JArray [JValue]
                  deriving(Eq, Ord, Show)

getString :: JValue -> Maybe String
getString (JString string) = Just string
getString _ = Nothing

getInt :: JValue -> Maybe Int
getInt (JNumber number) = Just (truncate number)
getInt _ = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JNumber number) = Just number
getDouble _ = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool bool) = Just bool
getBool _ = Nothing

isNull :: JValue -> Bool
isNull value = value == JNull

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObject o) = Just o
getObject _ = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray a) = Just a
getArray _ = Nothing

toString :: JValue -> String
toString JNull = "null"
toString (JBool True) = "true"
toString (JBool False) = "false"
toString (JNumber n) = show n
toString (JString s) = show s
toString (JObject obj) = "{" ++ pairs obj ++ "}"
                         where
                            pairs [] = ""
                            pairs ps = intercalate ", " (map renderPairs ps)
                            renderPairs (key, value) = show key ++ ":" ++ toString value

toString (JArray array) = "["++ value array ++"]"
                         where
                            value [] = ""
                            value arr = intercalate ", " (map toString array)
