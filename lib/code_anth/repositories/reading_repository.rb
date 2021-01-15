class ReadingRepository < Hanami::Repository
  def find_by_author(author)
    readings.where(author: author.to_s).first
  end

  def count
    readings.count
  end
end
