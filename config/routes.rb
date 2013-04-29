# encoding: utf-8
BoxberryApi::Engine.routes.draw do

  post 'api/boxberry' => 'boxberry#actions'

end # draw
