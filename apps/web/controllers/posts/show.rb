module Web
  module Controllers
    module Posts
      class Show
        include Web::Action
        expose :post, :content

        def call(params)
          repository = PostRepository.new
          @post = repository.find(params[:id].to_i)
          process_post
        end

        private
        def process_post
          @content = @post.content.split("&")
        end
      end
    end
  end
end
