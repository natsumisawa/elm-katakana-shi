module Test.Generated.Main1582180702 exposing (main)

import Tests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Tests" [Tests.partsToJson] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 111430857951639, processes = 4, paths = ["/Users/sawanatsumi/workspace/sandbox/elm-warota/tests/Tests.elm"]}