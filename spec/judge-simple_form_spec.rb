require "spec_helper"

describe Judge::SimpleForm do
  let(:template) do
    ActionView::Base.new(nil, {}, UsersController.new)
  end
  let(:builder) do
    SimpleForm::FormBuilder.new(:user, User.new, template, {}, nil)
  end
  let(:expected) do
    /data\-validate\=\"\[.+\]\"/
  end

  it "adds data attribute when :validate option is true" do
    builder.input(:name, :validate => true).should match expected
  end

  it "preserves other attributes" do
    builder.input(:name, :placeholder => 'foobar', :validate => true).should match expected
    builder.input(:name, :placeholder => 'foobar', :validate => true).should match 'placeholder'
  end

  it "does not add data attribute otherwise" do
    builder.input(:name).should_not match expected
  end
end