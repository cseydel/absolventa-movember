require 'spec_helper'

describe Bro do

  xit { should validate_presence_of(:firstname) }
  xit { should validate_presence_of(:lastname) }
  it { should have_many(:votes) }

end