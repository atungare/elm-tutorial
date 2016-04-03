module Main (..) where

import Html exposing (Html)
import Mouse

type alias Model = { count: Int }

initialModel : Model
initialModel =
  { count = 0 }

view : Model -> Html
view model =
  model
    |> .count
    |> toString
    |> Html.text


modelSignal : Signal.Signal Model
modelSignal =
  Signal.foldp (\_ state -> { state | count = state.count + 1 }) initialModel Mouse.clicks

main : Signal.Signal Html
main =
  Signal.map view modelSignal
