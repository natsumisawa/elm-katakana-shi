module Test.Generated.Main3207300290 exposing (main)

import Tests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Tests" [Tests.partsToJson] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 314377171213390, processes = 4, paths = ["/Users/sawanatsumi/workspace/sandbox/elm-warota/tests/Tests.elm"]}