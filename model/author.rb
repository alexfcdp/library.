class Author
  attr_reader :name_author, :biography

  def initialize(name_author, biography)
    @name_author = name_author
    @biography = biography
  end
end
