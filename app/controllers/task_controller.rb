
get '/task/?' do
  @tasks =  Tarea.all
  @tasks.sort! { |x,y| x["title"] <=> y["title"] }
  @flash = session[:flash]
  session[:flash] = nil
  erb :'task/index'
end

post '/task/new' do
  Tarea.create(params[:task])
  session[:flash] = {
    message: "La tarea ha sido agregada",
    type: "success"
  }
  redirect '/task'
end

patch '/task/:id/done' do
  Tarea.update(params[:id].to_i)
  session[:flash] = {
    message: "El estado de la tarea ha sido actualizado",
    type: "info"
  }
  redirect '/task'
end

delete '/task/:id/delete' do
  Tarea.destroy(params[:id].to_i)
  session[:flash] = {
    message: "La tarea ha sido eliminada",
    type: "info"
  }
  redirect '/task'
end