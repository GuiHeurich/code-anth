require 'spec_helper'

RSpec.describe ReadingRepository, type: :repository do
 let(:author) { "Matsumoto, Yukihiro" }
 let(:entry) {
   {
     author: author,
     title: "The Ruby Programming Language",
     url: "https://www.ruby-lang.org/en/documentation/",
     meeting_date: Date.today
    }
 }

 context "#find_by_author" do
   it "finds all the readings by an author" do
      subject.create(entry)
      expect(subject.find_by_author(author).author).to eq author
    end
  end

  context "#count" do
    it "counts the number of records" do
      subject.create(entry)
      expect(subject.count).to eq 1
    end
  end

  context "#all" do
    it "returns all readings" do
      subject.create(entry)
      expect(subject.all.first.author).to eq author
    end
  end
end
