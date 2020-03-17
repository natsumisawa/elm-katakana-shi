module Main exposing (main)

import Browser
import Html exposing (Attribute, Html, a, button, div, h1, img, input, p, span, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import KatakanaList exposing (katakanaList)
import Random exposing (..)


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { showK : Bool
    , katakana : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model True "ココニカタカナデルヨォ〜", Cmd.none )


type Msg
    = SetKatakana String
    | Random


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ showK, katakana } as model) =
    case msg of
        SetKatakana k ->
            let
                newShowK =
                    not showK

                newKatakana =
                    if newShowK then
                        katakana

                    else
                        k
            in
            ( { model | showK = newShowK, katakana = newKatakana }, Cmd.none )

        Random ->
            ( model, selectRandomKatakana )


selectRandomKatakana : Cmd Msg
selectRandomKatakana =
    Random.generate SetKatakana <| Random.uniform "ここ何？" katakanaList


view : Model -> Html Msg
view ({ katakana, showK } as model) =
    let
        fingerIdName =
            if showK then
                "buruburu"

            else
                ""
    in
    div []
        [ div [ class "header", align "center" ]
            [ h1 []
                [ text "カタカナ~シ" ]
            , text "ルール：カタカナなしで説明してネ〜"
            ]
        , div [ class "body", style "display" "flex", align "center" ]
            [ div [ class "warota" ] []
            , div [ class "finger", id fingerIdName, onClick Random ] []
            , div [ class "bubble1" ] []
            , span [ style "font-size" "20px", style "padding" "30px" ] [ text katakana ]
            , div [ class "bubble2" ] []
            ]
        , div [] [ text "とめてくれ〜" ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
