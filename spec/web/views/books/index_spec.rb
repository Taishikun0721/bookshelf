RSpec.describe Web::Views::Books::Index, type: :view do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.books).to eq exposures.fetch(:books)
  end

  context 'when there are no books' do
    it 'shows a placeholder mssage' do
      expect(rendered).to include('<p class="placeholder">There are no books yet.</p>')
    end
  end

  context 'when there are books' do
    let(:book1) { Book.new(title: 'Refactoring', author: 'Martin Fowler') }
    let(:book2) { Book.new(title: 'Domein Driven Design', author: 'Eric Evans') }
    let(:exposures) { Hash[books: [book1, book2]] }
    # 2つのインスタンスが配列に入ってviewに入って描画されていること

    it 'lists them all' do
      expect(rendered.scan(/class="book"/).length).to eq 2 #bookclassがついている物が2つある
      expect(rendered).to include('Refactoring')
      expect(rendered).to include('Domein Driven Design')
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include('<p class="placeholder">There are no books yet.</p>')
    end
  end
end
