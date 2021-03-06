require 'spec_helper'

describe Moustache do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  it { should have_many(:votes) }

end