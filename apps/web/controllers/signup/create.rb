module Web
  module Controllers
    module SignUp
      class Create
        include Web::Action

        params do
          required(:email).filled
          required(:password).filled
          required(:invite).filled
        end

        def call(params)
          status 400, 'Have you got an invite?' unless params.valid?
        end
      end
    end
  end
end