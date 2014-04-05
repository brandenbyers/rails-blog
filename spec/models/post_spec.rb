require 'spec_helper'

describe Post do
  it { should have_many :comments }
  
  describe '#title' do
   it { expect(subject).to have_valid(:title).when 'X'*5 }
   it { expect(subject).to_not have_valid(:title).when nil, '', 'X'*4 }
 end
end