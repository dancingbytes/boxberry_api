# encoding: utf-8
BoxberryApi::Engine.routes.draw do

  match 'api/boxberry' => 'boxberry#actions'

end # draw
