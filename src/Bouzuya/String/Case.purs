module Bouzuya.String.Case
  ( camelCase
  , capitalize
  , kebabCase
  , lowerCase
  , pascalCase
  , snakeCase
  , toParts
  , upperCase
  ) where

import Prelude

import Data.Array as Array
import Data.String as String
import Data.String.Regex (Regex)
import Data.String.Regex as Regex
import Data.String.Regex.Flags as RegexFlags
import Data.String.Regex.Unsafe as RegexUnsafe

camelCase :: String -> String
camelCase s =
  let
    parts = toParts s
  in
    (Array.fold <<< Array.concat)
      [ map lowerCase (Array.take 1 parts)
      , map capitalize (Array.drop 1 parts)
      ]

capitalize :: String -> String
capitalize s =
  (upperCase (String.take 1 s)) <> (lowerCase (String.drop 1 s))

kebabCase :: String -> String
kebabCase s = Array.intercalate "-" (map lowerCase (toParts s))

lowerCase :: String -> String
lowerCase = String.toLower

pascalCase :: String -> String
pascalCase = Array.fold <<< (map capitalize) <<< toParts

regexSeparator :: Regex
regexSeparator = RegexUnsafe.unsafeRegex "[^0-9A-Za-z]" RegexFlags.noFlags

regexUpper :: Regex
regexUpper = RegexUnsafe.unsafeRegex "(?=[A-Z])" RegexFlags.noFlags

snakeCase :: String -> String
snakeCase s = Array.intercalate "_" (map lowerCase (toParts s))

toParts :: String -> Array String
toParts s =
  Array.concatMap (Regex.split regexUpper) (Regex.split regexSeparator s)

upperCase :: String -> String
upperCase = String.toUpper
