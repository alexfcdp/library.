class Author
  attr_reader :name_author, :biography

  def initialize(author_data)
    @name_author = author_data[:name]
    @biography = author_data[:biography]
  end
end
