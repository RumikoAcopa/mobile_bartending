module ErrorsHelper 
    def show_errors_for(object)
        render partial: 'errors/errors', locals: {object: object} 
    end
end 