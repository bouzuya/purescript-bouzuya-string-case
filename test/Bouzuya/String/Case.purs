module Test.Bouzuya.String.Case
  ( tests
  ) where

import Prelude

import Bouzuya.String.Case as Case
import Data.Foldable as Foldable
import Test.Unit (TestSuite)
import Test.Unit as TestUnit
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = TestUnit.suite "Case" do
  TestUnit.test "examples" do
    Foldable.for_ ["foo-bar", "foo_bar", "fooBar", "FooBar"] \s -> do
      Assert.equal "fooBar" (Case.camelCase s)
      Assert.equal "foo-bar" (Case.kebabCase s)
      Assert.equal "FooBar" (Case.pascalCase s)
      Assert.equal "foo_bar" (Case.snakeCase s)

  TestUnit.test "camelCase" do
    Assert.equal "fooBar" (Case.camelCase "foo-bar")
    Assert.equal "fooBar" (Case.camelCase "foo_bar")
    Assert.equal "fooBar" (Case.camelCase "fooBar")
    Assert.equal "fooBar" (Case.camelCase "FooBar")

  TestUnit.test "capitalize" do
    Assert.equal "Foo-bar" (Case.capitalize "foo-bar")
    Assert.equal "Foo_bar" (Case.capitalize "foo_bar")
    Assert.equal "Foobar" (Case.capitalize "fooBar")
    Assert.equal "Foobar" (Case.capitalize "FooBar")

  TestUnit.test "kebabCase" do
    Assert.equal "foo-bar" (Case.kebabCase "foo-bar")
    Assert.equal "foo-bar" (Case.kebabCase "foo_bar")
    Assert.equal "foo-bar" (Case.kebabCase "fooBar")
    Assert.equal "foo-bar" (Case.kebabCase "FooBar")

  TestUnit.test "lowerCase" do
    Assert.equal "foo-bar" (Case.lowerCase "foo-bar")
    Assert.equal "foo_bar" (Case.lowerCase "foo_bar")
    Assert.equal "foobar" (Case.lowerCase "fooBar")
    Assert.equal "foobar" (Case.lowerCase "FooBar")

  TestUnit.test "pascalCase" do
    Assert.equal "FooBar" (Case.pascalCase "foo-bar")
    Assert.equal "FooBar" (Case.pascalCase "foo_bar")
    Assert.equal "FooBar" (Case.pascalCase "fooBar")
    Assert.equal "FooBar" (Case.pascalCase "FooBar")

  TestUnit.test "snakeCase" do
    Assert.equal "foo_bar" (Case.snakeCase "foo-bar")
    Assert.equal "foo_bar" (Case.snakeCase "foo_bar")
    Assert.equal "foo_bar" (Case.snakeCase "fooBar")
    Assert.equal "foo_bar" (Case.snakeCase "FooBar")
  TestUnit.test "toParts" do
    Assert.equal ["foo"] (Case.toParts "foo")
    Assert.equal ["foo", "bar"] (Case.toParts "foo-bar")
    Assert.equal ["foo", "bar"] (Case.toParts "foo_bar")
    Assert.equal ["foo", "Bar"] (Case.toParts "fooBar")
    Assert.equal ["Foo", "Bar"] (Case.toParts "FooBar")
  TestUnit.test "upperCase" do
    Assert.equal "FOO-BAR" (Case.upperCase "foo-bar")
    Assert.equal "FOO_BAR" (Case.upperCase "foo_bar")
    Assert.equal "FOOBAR" (Case.upperCase "fooBar")
    Assert.equal "FOOBAR" (Case.upperCase "FooBar")
  TestUnit.test "(constant)" do
    Assert.equal "FOO_BAR" (Case.upperCase (Case.snakeCase "foo-bar"))
    Assert.equal "FOO_BAR" (Case.upperCase (Case.snakeCase "foo_bar"))
    Assert.equal "FOO_BAR" (Case.upperCase (Case.snakeCase "fooBar"))
    Assert.equal "FOO_BAR" (Case.upperCase (Case.snakeCase "FooBar"))
