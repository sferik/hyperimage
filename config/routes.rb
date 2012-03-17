Hyperimage::Engine.routes.draw do

  get 'images/:resource.:format' => 'images#show', :as => 'images'

end
