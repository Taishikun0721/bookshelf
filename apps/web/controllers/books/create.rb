module Web
  module Controllers
    module Books
      class Create
        include Web::Action

        expose :book

        params do
          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
          end
        end
        # バリデーション。railsで言うpresence: true

        def call(params)
          if params.valid?
            BookRepository.new.create(params[:book])
            redirect_to '/books'
          else
            self.status = 422
          end
        end
        # Hanamiではアクション毎にclassを作成するので、このcallメソッドにメインの処理がかかれる？
        # TODO: 他にもメソッドを定義して使う方法を調べる。
      end
    end
  end
end
