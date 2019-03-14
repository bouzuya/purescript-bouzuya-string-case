module Test.Main where

import Prelude

import Effect (Effect)
import Test.Bouzuya.String.Case as Case
import Test.Unit.Main as TestUnitMain

main :: Effect Unit
main = TestUnitMain.runTest do
  Case.tests
