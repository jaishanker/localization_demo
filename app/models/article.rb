class Article < ActiveRecord::Base
  attr_accessible :body, :slug, :title, :locale
  extend FriendlyId
  friendly_id :title, use: :slugged

  translates :title, :body

  class Translation
    attr_accessible :locale
  end

private

  def should_generate_new_friendly_id?
    new_record?
  end
end
