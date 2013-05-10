require 'spec_helper'

describe ApplicationHelper do
  it "should print locale links for English" do
    I18n.locale = :en
    helper.stub(:url_for).and_return("/pt-BR")
    helper.language_links.should_not include("/en")
    helper.language_links.should include("/pt-BR")
  end

  it "should print locale links for Portuguese" do
    I18n.locale = :"pt-BR"
    helper.stub(:url_for).and_return("/en")
    helper.language_links.should_not include("/pt-BR")
    helper.language_links.should include("/en")
  end
end
