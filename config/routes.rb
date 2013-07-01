# encoding: utf-8
BoxberryApi::Engine.routes.draw do

  match 'api/boxberry(/:sc)' => 'boxberry#actions'

end # draw
