# purescript-bouzuya-string-case

`Bouzuya.String.Case` module

## Usage

```purescript
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
```

See [`test/Bouzuya/String/Case.purs`](test/Bouzuya/String/Case.purs)

## Installation

`packages.dhall`

```dhall
let additions = {=} //
      { bouzuya-string-case =
          mkPackage
          [ "arrays"
          , "prelude"
          , "strings"
          ]
          "https://github.com/bouzuya/purescript-bouzuya-string-case.git"
          "v0.1.0"
      }
```

```bash
spago install bouzuya-string-case
```

## How to build

```bash
npm install
```

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][email]&gt; ([https://bouzuya.net/][url])

[user]: https://github.com/bouzuya
[email]: mailto:m@bouzuya.net
[url]: https://bouzuya.net/
