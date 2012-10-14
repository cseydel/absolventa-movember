require 'spec_helper'

describe Vote do

  it { should validate_presence_of(:money_value) }
  it { should validate_numericality_of(:money_value) }

  xit { should validate_presence_of(:bro_id) }
  xit { should validate_presence_of(:moustache_id) }

  it { should belong_to(:bro) }
  it { should belong_to(:moustache) }


end