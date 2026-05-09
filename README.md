# include-filter

A pandoc filter to allow including reusable documents into a larger document.
Assuming you have a main markdown file `a.md` you can insert `b.md` into it
with a special codeblock.

```md
    ```{include="b.md"}

    ```
```

## Prerequisites

* [GHC](https://www.haskell.org/ghc/) (Glasgow Haskell Compiler)
* [Cabal](https://www.haskell.org/cabal/) (Included in [GHCup](https://www.ghcup.org/))

## Building and Running

To build the project:
```bash
cabal build
```

To run the executable:
```bash
cabal run
```

## Testing

To run the test suite:
```bash
cabal test
```

## License

This project is licensed under the The 3-Clause BSD License - see the LICENSE file for details.