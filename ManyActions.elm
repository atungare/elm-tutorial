module Main (..) where

import Html exposing (Html)
import Mouse
import Keyboard

type alias Model = { count: Int }

type Action = NoOp | MouseClick Int | KeyPress

initialModel : Model
initialModel =
  { count = 0 }

view : Model -> Html
view model =
  model.count
  |> toString
  |> Html.text

update : Action -> Model -> Model
update action model =
  case action of
    MouseClick amt ->
      { model | count = model.count + amt }
    KeyPress ->
      { model | count = model.count - 1 }
    _ ->
      model

mouseClickSignal : Signal.Signal Action
mouseClickSignal =
  Signal.map (\_ -> MouseClick 2) Mouse.clicks

keyPressSignal : Signal.Signal Action
keyPressSignal =
  Signal.map (\_ -> KeyPress) Keyboard.presses

actionSignal : Signal.Signal Action
actionSignal =
  Signal.merge mouseClickSignal keyPressSignal

modelSignal : Signal.Signal Model
modelSignal =
  Signal.foldp update initialModel actionSignal

main : Signal.Signal Html
main =
  Signal.map view modelSignal
