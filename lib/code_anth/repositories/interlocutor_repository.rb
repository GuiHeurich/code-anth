class InterlocutorRepository < Hanami::Repository
  def count
    interlocutors.count
  end
end
