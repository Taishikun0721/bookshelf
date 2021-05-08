module Web
  module Controllers
    module Books
      class Index
        include Web::Action

        expose :books
        # ゲッターを作成するメソッド。これがないとundefined local variable or method が出る

        def call(params)
          @books = BookRepository.new.all
        end
      end
    end
  end
end
