require 'sinatra'
require 'make_todo'

# Load configuration file
require './config/application'

# Load Routes
require './config/routes'

# To_do
require './app/controllers/task_controller'