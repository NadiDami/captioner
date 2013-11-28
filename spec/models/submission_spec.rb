require 'spec_helper'

describe Submission do
  let(:submission) {Submission.new photo: Rails.root.join("spec/_assets/dogs.png").open, description: "Dogs"}
  it { should belong_to(:user) }
  it { should have_and_belong_to_many :tags }
  

  context 'it is valid when' do
    it 'has a description of at least 3 characters and an image attached' do
      expect(submission).to be_valid
    end
  end

  context 'it is not valid when' do
    it 'has a description fewer than 3 characters' do
      submission.description = "Be"
      expect(submission).not_to be_valid
    end

    it 'has no image attached' do
      submission.photo = nil
      expect(submission).not_to be_valid
    end
  end

end
