class Article < ActiveRecord::Base
  attr_accessible :body, :slug, :title, :locale, :translations_attributes
  extend FriendlyId
  friendly_id :title, use: :slugged

  translates :title, :body
  accepts_nested_attributes_for :translations

  class Translation
    attr_accessible :locale, :title, :body
  end

private

  def should_generate_new_friendly_id?
    new_record?
  end
end
