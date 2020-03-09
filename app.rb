require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello Word'
  end

  run! if app_file == $PROGRAM_NAME
end