# encoding: utf-8
BoxberryApi::Engine.routes.draw do

  get 'api/boxberry' => 'boxberry#actions'

end # draw
