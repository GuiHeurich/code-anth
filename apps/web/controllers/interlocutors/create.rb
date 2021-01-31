module Web
  module Controllers
    module Interlocutors
      class Create
        include Web::Action

        def initialize(repository = InterlocutorRepository.new)
          @repository = repository
        end

        def call(params)
          interlocutor = params[:new_interlocutor]
          interlocutors_email = interlocutor[:email]
          @repository.create(email: interlocutors_email)
        end
      end
    end
  end
end
